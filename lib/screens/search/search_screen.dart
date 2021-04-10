import 'package:flutter/material.dart';
import 'package:swapi_dart/swapi_dart.dart';
import 'package:swtp/screens/details/details_screen.dart';
import 'package:swtp/widgets/people_item_list_item.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<PeopleItem> _peopleItemList = [];
  final FocusNode _searchFocusNode = FocusNode();
  _ViewType _viewType = _ViewType.list;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: null,
            titleSpacing: 4,
            title: _buildSearchBox(40, 8),
            actions: [_buildViewSwitchButton()],
          ),
          _buildResults(),
        ],
      ),
    );
  }

  Widget _buildViewSwitchButton() {
    return IconButton(
        icon: Icon(_viewType == _ViewType.grid ? Icons.list : Icons.grid_view),
        onPressed: () {
          setState(() {
            _viewType =
                _viewType == _ViewType.list ? _ViewType.grid : _ViewType.list;
          });
        });
  }

  Widget _buildResults() {
    final list = List.from(_peopleItemList);
    const padding = 8.0;

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
              childCount: _peopleItemList.length,
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
                hintText: 'Search for people',
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

  void _searchFor(String name) async {
    _peopleItemList.clear();
    if (name.isNotEmpty) {
      var people = await Swapi.searchAllPeople(name);
      _peopleItemList.addAll(people);
    }
    setState(() {});
  }
}

enum _ViewType {
  list,
  grid,
}
