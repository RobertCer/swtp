import 'package:swapi_dart/swapi_dart.dart';
import 'package:swtp/models/detailed_list_item_holder.dart';

import '../detailed_swapi_item.dart';

class SpeciesItemDetailed extends DetailedSwapiItem<SpeciesItem> {
  late final PlanetsItem? homeWorld;
  late final List<PeopleItem> people;
  late final List<FilmsItem> films;

  SpeciesItemDetailed({
    required SpeciesItem swapiItem,
    required this.people,
    required this.films,
    this.homeWorld,
  }) : super(swapiItem: swapiItem);

  @override
  List<DetailsListItemHolder<SwapiItem>> getDetailsList() {
    return <DetailsListItemHolder<SwapiItem>>[
      DetailsListItemHolder(
        title: 'Name',
        value: swapiItem.name,
      ),
      DetailsListItemHolder(
        title: 'Classification',
        value: swapiItem.classification,
      ),
      DetailsListItemHolder(
        title: 'Designation',
        value: swapiItem.designation,
      ),
      DetailsListItemHolder(
        title: 'Average height',
        value: swapiItem.averageHeight,
      ),
      DetailsListItemHolder(
        title: 'Eye color',
        value: swapiItem.eyeColors,
      ),
      DetailsListItemHolder(
        title: 'Skin color',
        value: swapiItem.skinColors,
      ),
      DetailsListItemHolder(
        title: 'Language',
        value: swapiItem.language,
      ),
      if (homeWorld != null)
        DetailsListItemHolder(
          title: 'Homeworld',
          value: homeWorld!.name,
          item: homeWorld!,
        ),
      DetailsListItemHolder(
        title: 'People',
        value: '${people.length}',
        items: people,
      ),
      DetailsListItemHolder(
        title: 'Films',
        value: '${films.length}',
        items: films,
      ),
    ];
  }
}
