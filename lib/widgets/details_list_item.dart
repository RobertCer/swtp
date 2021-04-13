import 'package:flutter/material.dart';
import 'package:swapi_dart/swapi_dart.dart';
import 'package:swtp/models/detailed_list_item_holder.dart';
import 'package:swtp/extensions/swapi_item_utils.dart';

class DetailsListItem extends StatefulWidget {
  final DetailsListItemHolder<SwapiItem> item;
  final void Function(SwapiItem)? onPressed;

  const DetailsListItem({
    Key? key,
    required this.item,
    this.onPressed,
  }) : super(key: key);

  @override
  _DetailsListItemState createState() => _DetailsListItemState();
}

class _DetailsListItemState extends State<DetailsListItem> {
  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    if (item.items?.isNotEmpty ?? false) {
      return ExpansionTile(
        title: Text(item.title),
        subtitle: Text(item.value.toString()),
        children: [
          ...item.items!.map(
            (swapiItem) => ListTile(
              title: Text(swapiItem.detailsTitle),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => widget.onPressed?.call(swapiItem),
            ),
          )
        ],
      );
    } else {
      return ListTile(
        title: Text(item.title),
        subtitle: Text(item.value.toString()),
        trailing: item.item != null ? Icon(Icons.keyboard_arrow_right) : null,
        onTap: (item.item != null)
            ? () => widget.onPressed?.call(item.item!)
            : null,
      );
    }
  }
}
