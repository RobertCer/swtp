import 'package:swapi_dart/swapi_dart.dart';

abstract class Database {
  Future<void> initialize();

  Future<void> saveFilmsItems(List<FilmsItem> items, {bool closeAfter = false});
  Future<Map<String, FilmsItem?>> getFilmsItems(List<String> ids,
      {bool closeAfter = false});

  Future<void> saveSpeciesItems(List<SpeciesItem> items,
      {bool closeAfter = false});
  Future<Map<String, SpeciesItem?>> getSpeciesItems(List<String> ids,
      {bool closeAfter = false});

  Future<void> savePlanetsItem(List<PlanetsItem> items,
      {bool closeAfter = false});
  Future<Map<String, PlanetsItem?>> getPlanetsItems(List<String> ids,
      {bool closeAfter = false});

  Future<void> saveStarshipsItems(List<StarshipsItem> items,
      {bool closeAfter = false});
  Future<Map<String, StarshipsItem?>> getStarshipsItems(List<String> ids,
      {bool closeAfter = false});

  Future<void> saveVehiclesItems(List<VehiclesItem> items,
      {bool closeAfter = false});
  Future<Map<String, VehiclesItem?>> getVehiclesItems(List<String> ids,
      {bool closeAfter = false});

  Future<void> savePeopleItems(List<PeopleItem> items,
      {bool closeAfter = false});
  Future<Map<String, PeopleItem?>> getPeopleItems(List<String> ids,
      {bool closeAfter = false});
}
