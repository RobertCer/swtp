import 'package:swapi_dart/swapi_dart.dart';

import 'detailed_list_item_holder.dart';

abstract class DetailedSwapiItem<T extends SwapiItem> {
  DetailedSwapiItem({
    required this.swapiItem,
  });

  T swapiItem;
  List<DetailsListItemHolder<SwapiItem>> getDetailsList();
}
