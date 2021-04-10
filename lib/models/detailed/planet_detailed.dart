import 'package:swapi_dart/swapi_dart.dart';
import 'package:swtp/models/detailed_list_item_holder.dart';

import '../detailed_swapi_item.dart';

class PlanetsItemDetailed extends DetailedSwapiItem<PlanetsItem> {
  late final List<PeopleItem> residents;
  late final List<FilmsItem> films;

  PlanetsItemDetailed({
    required PlanetsItem swapiItem,
    required this.residents,
    required this.films,
  }) : super(swapiItem: swapiItem);

  @override
  List<DetailsListItemHolder<SwapiItem>> getDetailsList() {
    return <DetailsListItemHolder<SwapiItem>>[
      DetailsListItemHolder(
        title: 'Name',
        value: swapiItem.name,
      ),
      DetailsListItemHolder(
        title: 'Diameter',
        value: swapiItem.diameter,
      ),
      DetailsListItemHolder(
        title: 'Rotation period',
        value: swapiItem.rotationPeriod,
      ),
      DetailsListItemHolder(
        title: 'Orbital period',
        value: swapiItem.orbitalPeriod,
      ),
      DetailsListItemHolder(
        title: 'Gravity',
        value: swapiItem.gravity,
      ),
      DetailsListItemHolder(
        title: 'Climate',
        value: swapiItem.climate,
      ),
      DetailsListItemHolder(
        title: 'Terrain',
        value: swapiItem.terrain,
      ),
      DetailsListItemHolder(
        title: 'Surface water',
        value: swapiItem.surfaceWater == '1' ? 'True' : 'False',
      ),
      DetailsListItemHolder(
        title: 'Residents',
        value: '${residents.length}',
        items: residents,
      ),
    ];
  }
}
