import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapi_dart/swapi_dart.dart';
import 'package:swtp/screens/details/details_screen.dart';
import 'package:swtp/screens/search/bloc/searcher_bloc.dart';
import 'package:swtp/widgets/custom_progress_indicator.dart';
import 'package:swtp/widgets/people_item_list_item.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode _searchFocusNode = FocusNode();
  late final SearcherBloc _searchBloc;
  bool _initialized = false;

  _ViewType _viewType = _ViewType.list;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;

    final swapi = RepositoryProvider.of<Swapi>(context);
    _searchBloc = SearcherBloc(swapi);

    _initialized = true;
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom -
        kToolbarHeight -
        kBottomNavigationBarHeight;

    final sliverAppBar = SliverAppBar(
      forceElevated: true,
      pinned: true,
      leading: null,
      collapsedHeight: kToolbarHeight,
      titleSpacing: 4,
      title: _buildSearchBox(40, 8),
      actions: [_buildViewSwitchButton()],
    );

    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        sliverAppBar,
        _buildBodyContent(height),
      ],
    );
  }

  Widget _buildViewSwitchButton() {
    return IconButton(
      icon: Icon(_viewType == _ViewType.grid ? Icons.list : Icons.grid_view),
      onPressed: () => setState(() {
        _viewType =
            _viewType == _ViewType.list ? _ViewType.grid : _ViewType.list;
      }),
    );
  }

  Widget _buildBodyContent(double height) {
    return SliverToBoxAdapter(
      child: BlocBuilder<SearcherBloc, SearcherState>(
        bloc: _searchBloc,
        builder: (context, state) {
          return Container(
            height: height,
            child: _buildForState(state),
          );
          // return _s(state);
        },
      ),
    );

    // return SliverToBoxAdapter(
    //   child: Container(
    //     color: Colors.green,
    //     height: height,
    //     alignment: Alignment.center,
    //     // height: constraints.maxHeight,
    //     child: Center(child: Text('heres')),
    //   ),
    // );
    return SliverToBoxAdapter(
      child: Container(
        height: height,
        child: BlocBuilder<SearcherBloc, SearcherState>(
          bloc: _searchBloc,
          builder: (context, state) {
            if (state is SearcherInitial) {
              return Container(color: Colors.white);
            } else if (state is SearcherSearching) {
              return Center(child: CustomProgressIndicator());
            } else if (state is SearcherError) {
              // TODO: Display proper error message
              return Center(child: Text(state.error.toString()));
            } else if (state is SearcherResult) {
              return _buildResults(state.searchResult);
            } else {
              return Container(color: Colors.red);
            }
          },
        ),
      ),
    );
  }

  Widget _buildForState(SearcherState state) {
    if (state is SearcherInitial) {
      return Container(color: Colors.white);
    } else if (state is SearcherSearching) {
      return Center(child: CustomProgressIndicator());
    } else if (state is SearcherError) {
      // TODO: Display proper error message
      return Center(child: Text(state.error.toString()));
    } else if (state is SearcherResult) {
      return _buildResults(state.searchResult);
    } else {
      return Container(color: Colors.red);
    }
  }

  Widget _buildResults(List<PeopleItem> peopleItemList) {
    final list = List.from(peopleItemList);
    const padding = 8.0;

    final child;

    switch (_viewType) {
      case _ViewType.list:
        child = ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: padding / 2),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: padding / 2,
                horizontal: padding,
              ),
              child: PeopleItemListItem(
                peopleItem: list[index],
                onPressed: (peopleItem) {
                  Navigator.of(context).pushNamed(
                    DetailsScreen.routeName,
                    arguments: DetailsScreen.createArguments(peopleItem),
                  );
                },
              ),
            );
          },
        );
        break;
      case _ViewType.grid:
        child = GridView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: padding / 2,
            horizontal: padding,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: padding,
            crossAxisSpacing: padding,
          ),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: padding / 2),
              child: PeopleItemListItem(
                peopleItem: list[index],
                onPressed: (peopleItem) {
                  Navigator.of(context).pushNamed(
                    DetailsScreen.routeName,
                    arguments: DetailsScreen.createArguments(peopleItem),
                  );
                },
              ),
            );
          },
        );
        break;
    }

    return child;
    // return MediaQuery.removePadding(
    //   context: context,
    //   removeTop: true,
    //   child: child,
    // );

    switch (_viewType) {
      case _ViewType.list:
        return SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: padding,
            vertical: padding / 2,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: padding / 2),
                  child: PeopleItemListItem(
                    peopleItem: list[index],
                    onPressed: (peopleItem) {
                      Navigator.of(context).pushNamed(
                        DetailsScreen.routeName,
                        arguments: DetailsScreen.createArguments(peopleItem),
                      );
                    },
                  ),
                );
              },
              childCount: peopleItemList.length,
            ),
          ),
        );
      case _ViewType.grid:
        return SliverPadding(
          padding: const EdgeInsets.all(padding),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PeopleItemListItem(
                  peopleItem: list[index],
                  onPressed: (peopleItem) {
                    Navigator.of(context).pushNamed(
                      DetailsScreen.routeName,
                      arguments: DetailsScreen.createArguments(peopleItem),
                    );
                  },
                );
              },
              childCount: list.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: padding,
              mainAxisSpacing: padding,
            ),
          ),
        );
    }
  }

  Widget _buildSearchBox(double textFieldHeight, double radius) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_searchFocusNode),
      child: Container(
        color: Colors.transparent,
        height: textFieldHeight,
        child: IgnorePointer(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            child: TextField(
              focusNode: _searchFocusNode,
              textInputAction: TextInputAction.search,
              onSubmitted: (val) => _searchFor(val),
              scrollPadding: EdgeInsets.zero,
              decoration: InputDecoration(
                hintText: 'Search for characters',
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _searchFor(String name) {
    _searchBloc.add(SearcherSearch(name));
  }

  Widget _b(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: _buildSearchBox(45, 8),
                floating: true,
                snap: true,
                // expandedHeight: 200.0,
                forceElevated: innerBoxIsScrolled,
              ),
            )
          ];
        },
        body: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              // The "controller" and "primary" members should be left
              // unset, so that the NestedScrollView can control this
              // inner scroll view.
              // If the "controller" property is set, then this scroll
              // view will not be associated with the NestedScrollView.
              slivers: <Widget>[
                SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context)),
                SliverFixedExtentList(
                  itemExtent: 48.0,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) =>
                        ListTile(title: Text('Item $index')),
                    childCount: 30,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

enum _ViewType {
  list,
  grid,
}
