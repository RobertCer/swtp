import 'package:swapi_dart/swapi_dart.dart';
import 'package:swtp/models/detailed_list_item_holder.dart';

import '../detailed_swapi_item.dart';

class PeopleItemDetailed extends DetailedSwapiItem<PeopleItem> {
  late final List<FilmsItem> filmsList;
  late final List<SpeciesItem> speciesList;
  late final List<StarshipsItem> starShipsList;
  late final List<VehiclesItem> vehiclesList;
  late final PlanetsItem homeWorld;

  PeopleItemDetailed({
    required PeopleItem peopleItem,
    required this.filmsList,
    required this.speciesList,
    required this.starShipsList,
    required this.vehiclesList,
    required this.homeWorld,
  }) : super(swapiItem: peopleItem);

  @override
  List<DetailsListItemHolder<SwapiItem>> getDetailsList() {
    return <DetailsListItemHolder<SwapiItem>>[
      DetailsListItemHolder(
        title: 'Name',
        value: swapiItem.name,
      ),
      DetailsListItemHolder(
        title: 'Birth year',
        value: swapiItem.birthYear,
      ),
      DetailsListItemHolder(
        title: 'Eye color',
        value: swapiItem.eyeColor,
      ),
      DetailsListItemHolder(
        title: 'Gender',
        value: swapiItem.gender,
      ),
      DetailsListItemHolder(
        title: 'Hair color',
        value: swapiItem.hairColor,
      ),
      DetailsListItemHolder(
        title: 'Height',
        value: swapiItem.height,
      ),
      DetailsListItemHolder(
        title: 'Mass',
        value: swapiItem.mass,
      ),
      DetailsListItemHolder(
        title: 'Skin color',
        value: swapiItem.skinColor,
      ),
      DetailsListItemHolder(
        title: 'Home world',
        value: homeWorld.name,
        item: homeWorld,
      ),
      DetailsListItemHolder(
        title: 'Films',
        value: '${filmsList.length}',
        items: filmsList,
      ),
      DetailsListItemHolder(
        title: 'Species',
        value: '${speciesList.length}',
        items: speciesList,
      ),
      DetailsListItemHolder(
        title: 'Starships',
        value: '${starShipsList.length}',
        items: starShipsList,
      ),
      DetailsListItemHolder(
        title: 'Vehicles',
        value: '${vehiclesList.length}',
        items: vehiclesList,
      ),
    ];
  }
}
