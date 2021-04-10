import 'package:flutter/material.dart';
import 'package:swapi_dart/swapi_dart.dart';

import 'people_item_list_item.dart';

class PeopleItemList extends StatelessWidget {
  // final double topPadding;
  final List<PeopleItem> peopleItemList;
  final Function(PeopleItem peopleItem)? onPressed;

  const PeopleItemList({
    Key? key,
    required this.peopleItemList,
    // required this.topPadding,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return PeopleItemListItem(peopleItem: peopleItemList[index]);
        },
        childCount: peopleItemList.length,
      ),
    );

    // return ListView.builder(
    //   // padding: EdgeInsets.only(top: topPadding),
    //   keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    //   shrinkWrap: true,
    //   primary: true,
    //   // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //   //   crossAxisCount: 1,
    //   //   childAspectRatio: 2,
    //   // ),
    //   itemCount: peopleItemList.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     final peopleItem = peopleItemList[index];
    //     return PeopleItemListItem(
    //       peopleItem: peopleItem,
    //       onPressed: onPressed,
    //     );
    //   },
    // );
  }
}
