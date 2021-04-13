import 'package:swapi_dart/swapi_dart.dart';
import 'package:swtp/models/detailed_list_item_holder.dart';

import '../detailed_swapi_item.dart';

class VehiclesItemDetailed extends DetailedSwapiItem<VehiclesItem> {
  late final List<FilmsItem> films;
  late final List<PeopleItem> pilots;

  VehiclesItemDetailed({
    required VehiclesItem swapiItem,
    required this.films,
    required this.pilots,
  }) : super(swapiItem: swapiItem);

  @override
  List<DetailsListItemHolder<SwapiItem>> getDetailsList() {
    return <DetailsListItemHolder<SwapiItem>>[
      DetailsListItemHolder(
        title: 'Name',
        value: swapiItem.name,
      ),
      DetailsListItemHolder(
        title: 'Model',
        value: swapiItem.model,
      ),
      DetailsListItemHolder(
        title: 'Vehicle class',
        value: swapiItem.vehicleClass,
      ),
      DetailsListItemHolder(
        title: 'Manufacturer',
        value: swapiItem.manufacturer,
      ),
      DetailsListItemHolder(
        title: 'Length',
        value: swapiItem.length,
      ),
      DetailsListItemHolder(
        title: 'Cost in credits',
        value: swapiItem.costInCredits,
      ),
      DetailsListItemHolder(
        title: 'Crew',
        value: swapiItem.crew,
      ),
      DetailsListItemHolder(
        title: 'Passengers',
        value: swapiItem.passengers,
      ),
      DetailsListItemHolder(
        title: 'Max atmosphering speed',
        value: swapiItem.maxAtmospheringSpeed,
      ),
      DetailsListItemHolder(
        title: 'Cargo capacity',
        value: swapiItem.cargoCapacity,
      ),
      DetailsListItemHolder(
        title: 'Consumables',
        value: swapiItem.consumables,
      ),
      DetailsListItemHolder(
        title: 'Films',
        value: '${films.length}',
        items: films,
      ),
      DetailsListItemHolder(
        title: 'Pilots',
        value: '${pilots.length}',
        items: pilots,
      ),
    ];
  }
}
