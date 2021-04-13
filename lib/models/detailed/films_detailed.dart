import 'package:swapi_dart/swapi_dart.dart';
import 'package:swtp/models/detailed_list_item_holder.dart';

import '../detailed_swapi_item.dart';

class FilmsItemDetailed extends DetailedSwapiItem<FilmsItem> {
  final List<SpeciesItem> species;
  final List<StarshipsItem> starships;
  final List<VehiclesItem> vehicles;
  final List<PeopleItem> characters;
  final List<PlanetsItem> planets;

  FilmsItemDetailed({
    required FilmsItem swapiItem,
    required this.species,
    required this.starships,
    required this.characters,
    required this.planets,
    required this.vehicles,
  }) : super(swapiItem: swapiItem);

  @override
  List<DetailsListItemHolder<SwapiItem>> getDetailsList() {
    return <DetailsListItemHolder<SwapiItem>>[
      DetailsListItemHolder(
        title: 'Title',
        value: swapiItem.title,
      ),
      DetailsListItemHolder(
        title: 'Opening crawl',
        value: swapiItem.openingCrawl,
      ),
      DetailsListItemHolder(
        title: 'Director',
        value: swapiItem.director,
      ),
      DetailsListItemHolder(
        title: 'Producer',
        value: swapiItem.producer,
      ),
      DetailsListItemHolder(
        title: 'Release date',
        value: swapiItem.releaseDate,
      ),
      DetailsListItemHolder(
        title: 'Species',
        value: '${species.length}',
        items: species,
      ),
      DetailsListItemHolder(
        title: 'Starships',
        value: '${starships.length}',
        items: starships,
      ),
      DetailsListItemHolder(
        title: 'Vehicles',
        value: '${vehicles.length}',
        items: vehicles,
      ),
      DetailsListItemHolder(
        title: 'Planets',
        value: '${planets.length}',
        items: planets,
      ),
    ];
  }
}
