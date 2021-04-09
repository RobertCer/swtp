import 'package:swtp/models/films.dart';
import 'package:swtp/models/species.dart';
import 'package:swtp/models/starships.dart';
import 'package:swtp/models/vehicles.dart';

abstract class Database {
  Future<void> saveFilmsItem(FilmsItem filmsItem);
  Future<FilmsItem?> getFilmsItem(String id);
  Future<void> saveVehiclesItem(VehiclesItem vehiclesItem);
  Future<VehiclesItem?> getVehiclesItem(String id);
  Future<void> saveSpeciesItem(SpeciesItem speciesItem);
  Future<SpeciesItem?> getSpeciesItem(String id);
  Future<void> saveStarshipsItem(StarshipsItem starshipsItem);
  Future<StarshipsItem?> getStarshipsItem(String id);
}

class DatabaseImpl extends Database {
  @override
  Future<FilmsItem?> getFilmsItem(String id) {
    // TODO: implement getFilmsItem
    throw UnimplementedError();
  }

  @override
  Future<SpeciesItem?> getSpeciesItem(String id) {
    // TODO: implement getSpeciesItem
    throw UnimplementedError();
  }

  @override
  Future<StarshipsItem?> getStarshipsItem(String id) {
    // TODO: implement getStarshipsItem
    throw UnimplementedError();
  }

  @override
  Future<VehiclesItem?> getVehiclesItem(String id) {
    // TODO: implement getVehiclesItem
    throw UnimplementedError();
  }

  @override
  Future<void> saveFilmsItem(FilmsItem filmsItem) {
    // TODO: implement saveFilmsItem
    throw UnimplementedError();
  }

  @override
  Future<void> saveSpeciesItem(SpeciesItem speciesItem) {
    // TODO: implement saveSpeciesItem
    throw UnimplementedError();
  }

  @override
  Future<void> saveStarshipsItem(StarshipsItem starshipsItem) {
    // TODO: implement saveStarshipsItem
    throw UnimplementedError();
  }

  @override
  Future<void> saveVehiclesItem(VehiclesItem vehiclesItem) {
    // TODO: implement saveVehiclesItem
    throw UnimplementedError();
  }
}

class DatabaseMock extends Database {
  final Map<String, FilmsItem> filmsItemMap = {};
  final Map<String, SpeciesItem> speciesItemMap = {};
  final Map<String, StarshipsItem> starshipsItemMap = {};
  final Map<String, VehiclesItem> vehiclesItemMap = {};

  @override
  Future<FilmsItem?> getFilmsItem(String id) async {
    return filmsItemMap[id];
  }

  @override
  Future<SpeciesItem?> getSpeciesItem(String id) async {
    return speciesItemMap[id];
  }

  @override
  Future<StarshipsItem?> getStarshipsItem(String id) async {
    return starshipsItemMap[id];
  }

  @override
  Future<VehiclesItem?> getVehiclesItem(String id) async {
    return vehiclesItemMap[id];
  }

  @override
  Future<void> saveFilmsItem(FilmsItem filmsItem) async {
    filmsItemMap[filmsItem.url] = filmsItem;
  }

  @override
  Future<void> saveSpeciesItem(SpeciesItem speciesItem) async {
    speciesItemMap[speciesItem.url] = speciesItem;
  }

  @override
  Future<void> saveStarshipsItem(StarshipsItem starshipsItem) async {
    starshipsItemMap[starshipsItem.url] = starshipsItem;
  }

  @override
  Future<void> saveVehiclesItem(VehiclesItem vehiclesItem) async {
    vehiclesItemMap[vehiclesItem.url] = vehiclesItem;
  }
}
