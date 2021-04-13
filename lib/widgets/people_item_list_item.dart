import 'package:flutter/material.dart';
import 'package:swapi_dart/swapi_dart.dart';

class PeopleItemListItem extends StatelessWidget {
  final PeopleItem peopleItem;
  final Function(PeopleItem peopleItem)? onPressed;

  const PeopleItemListItem({
    Key? key,
    required this.peopleItem,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        // margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: () {
            onPressed?.call(peopleItem);
          },
          child: Container(
            // decoration: BoxDecoration(color: Colors.white70),
            // padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  peopleItem.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
