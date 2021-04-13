import 'package:swapi_dart/swapi_dart.dart';

extension SwapiItemUtil on SwapiItem {
  String get detailsTitle {
    if (this is PeopleItem) {
      return (this as PeopleItem).name;
    } else if (this is PlanetsItem) {
      return (this as PlanetsItem).name;
    } else if (this is FilmsItem) {
      return (this as FilmsItem).title;
    } else if (this is SpeciesItem) {
      return (this as SpeciesItem).name;
    } else if (this is StarshipsItem) {
      return (this as StarshipsItem).name;
    } else if (this is VehiclesItem) {
      return (this as VehiclesItem).name;
    }
    return 'Unknown';
  }
}
