import '../films.dart';
import '../species.dart';
import '../starships.dart';
import '../people.dart';
import '../vehicles.dart';

class PeopleItemDetailed extends PeopleItem {
  late final List<FilmsItem> filmsList;
  late final List<Species> speciesList;
  late final List<Starships> starShipsList;
  late final List<Vehicles> vehiclesList;

  // PeopleItemDetailed(Map map) : super(map) {
  //   if (map.containsKey('filmsList') && map['filmsList'] is List<FilmsItem>) {
  //     filmsList = map['filmsList'];
  //   } else {
  //     filmsList = [];
  //   }

  //   if (map.containsKey('speciesList') &&
  //       map['speciesList'] is List<FilmsItem>) {
  //     speciesList = map['speciesList'];
  //   } else {
  //     speciesList = [];
  //   }

  //   if (map.containsKey('starShipsList') &&
  //       map['starShipsList'] is List<FilmsItem>) {
  //     starShipsList = map['starShipsList'];
  //   } else {
  //     starShipsList = [];
  //   }

  //   if (map.containsKey('vehiclesList') &&
  //       map['vehiclesList'] is List<FilmsItem>) {
  //     vehiclesList = map['vehiclesList'];
  //   } else {
  //     vehiclesList = [];
  //   }
  // }

  PeopleItemDetailed({
    required PeopleItem peopleItem,
    required List<FilmsItem> filmsList,
    required List<Species> speciesList,
    required List<Starships> starShipsList,
    required List<Vehicles> vehiclesList,
  }) : super(peopleItem.toMap());
}
