import 'package:swapi_dart/swapi_dart.dart';
import 'package:swtp/models/detailed_list_item_holder.dart';

import '../detailed_swapi_item.dart';

class StarshipsItemDetailed extends DetailedSwapiItem<StarshipsItem> {
  final List<FilmsItem> films;
  final List<PeopleItem> pilots;

  StarshipsItemDetailed({
    required StarshipsItem swapiItem,
    required this.pilots,
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
        title: 'Model',
        value: swapiItem.model,
      ),
      DetailsListItemHolder(
        title: 'Starship class',
        value: swapiItem.starshipClass,
      ),
      DetailsListItemHolder(
        title: 'Manufacturer',
        value: swapiItem.manufacturer,
      ),
      DetailsListItemHolder(
        title: 'Cost in credits',
        value: swapiItem.costInCredits,
      ),
      DetailsListItemHolder(
        title: 'Length',
        value: swapiItem.length,
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
        title: 'Max atmosphering speed ',
        value: swapiItem.maxAtmospheringSpeed,
      ),
      DetailsListItemHolder(
        title: 'Hyperdrive rating',
        value: swapiItem.hyperdriveRating,
      ),
      DetailsListItemHolder(
        title: 'MGLT',
        value: swapiItem.mglt,
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
