import 'package:flutter/material.dart';
import 'package:swtp/models/people.dart';
import 'package:swtp/repositories/swapi.dart';
import 'package:swtp/screens/details_screen.dart';
import 'package:swtp/widgets/people_item_list.dart';
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchFocusNode.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            // backgroundColor: Colors.transparent,
            // forceElevated: true,
            // snap: true,
            // floating: true,
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
    // return ListView.builder(
    //   // padding: EdgeInsets.only(top: topPadding),
    //   keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    //   shrinkWrap: true,
    //   primary: true,
    //   // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //   //   crossAxisCount: 1,
    //   //   childAspectRatio: 2,
    //   // ),
    //   itemCount: list.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     final peopleItem = list[index];
    //     return PeopleItemListItem(
    //       peopleItem: peopleItem,
    //       // onPressed: onPressed,
    //     );
    //   },
    // );
    //
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

    // return PeopleItemList(
    //   peopleItemList: _peopleItemList,
    // onPressed: (peopleItem) {
    //   Navigator.of(context).pushNamed(
    //     DetailsScreen.routeName,
    //     arguments: DetailsScreen.createArguments(peopleItem),
    //   );
    // },
    // );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: LayoutBuilder(
  //         builder: (context, constraints) {
  //           final textFieldHeight = 46.0;
  //           const radius = 8.0;
  //           return Container(
  //             padding: const EdgeInsets.symmetric(vertical: 8),
  //             child: Stack(
  //               // fit: StackFit.expand,
  //               children: [
  //                 if (_peopleItemList.isNotEmpty)
  //                   _buildResultsWidget(constraints.maxHeight, textFieldHeight),
  //                 _buildSearchBox(textFieldHeight, radius),
  //               ],
  //             ),
  //             // child: buildColumn(textFieldHeight, radius, constraints, context),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildResultsWidget(double height, double topPadding) {
  //   return SingleChildScrollView(
  //     child: Container(
  //       height: height,
  //       child: PeopleItemList(
  //         peopleItemList: _peopleItemList,
  //         onPressed: (peopleItem) {
  //           Navigator.of(context).pushNamed(
  //             DetailsScreen.routeName,
  //             arguments: DetailsScreen.createArguments(peopleItem),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  Column buildColumn(
    double textFieldHeight,
    double radius,
    BoxConstraints constraints,
    BuildContext context,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Flexible(
                child: _buildSearchBox(textFieldHeight, radius),
              ),
              // const SizedBox(width: 16),
              IconButton(
                icon: Icon(Icons.view_column),
                onPressed: () {},
              )
            ],
          ),
        ),
        if (_peopleItemList.isNotEmpty)
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: constraints.maxHeight - textFieldHeight,
                child: PeopleItemList(
                  peopleItemList: _peopleItemList,
                  onPressed: (peopleItem) {
                    Navigator.of(context).pushNamed(
                      DetailsScreen.routeName,
                      arguments: DetailsScreen.createArguments(peopleItem),
                    );
                  },
                ),
              ),
            ),
          )
      ],
    );
  }

  Widget _buildSearchBox(double textFieldHeight, double radius) {
    return GestureDetector(
      onTap: () {
        final offset = _scrollController.offset;
        FocusScope.of(context).requestFocus(_searchFocusNode);
        // _searchFocusNode.requestFocus();
        _scrollController.jumpTo(offset);
      },
      child: Container(
        color: Colors.transparent,
        height: textFieldHeight,
        child: IgnorePointer(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              // shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            child: TextField(
              focusNode: _searchFocusNode,
              textInputAction: TextInputAction.search,
              onSubmitted: (val) => _searchFor(val),
              scrollPadding: EdgeInsets.zero,
              decoration: InputDecoration(
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
