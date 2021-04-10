import 'package:swtp/models/films.dart';
import 'package:swtp/models/people.dart';
import 'package:swtp/models/planet.dart';
import 'package:swtp/models/species.dart';
import 'package:swtp/models/starships.dart';
import 'package:swtp/models/vehicles.dart';

extension PlanetsItemHive on PlanetsItem {
  String get id => url;
}

extension PeopleItemHive on PeopleItem {
  String get id => url;
}

extension SpeciesItemHive on SpeciesItem {
  String get id => url;
}

extension StarshipsItemHive on StarshipsItem {
  String get id => url;
}

extension VehiclesItemHive on VehiclesItem {
  String get id => url;
}

extension FilmsItemHive on FilmsItem {
  String get id => url;
}
