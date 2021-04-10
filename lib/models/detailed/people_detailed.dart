import 'package:swtp/models/planet.dart';

import '../films.dart';
import '../species.dart';
import '../starships.dart';
import '../people.dart';
import '../vehicles.dart';

class PeopleItemDetailed extends PeopleItem {
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
  }) : super(peopleItem.toMap());
}
