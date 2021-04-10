import 'package:swtp/models/films.dart';
import 'package:swtp/models/people.dart';
import 'package:swtp/models/planet.dart';
import 'package:swtp/models/species.dart';
import 'package:swtp/models/starships.dart';
import 'package:swtp/models/vehicles.dart';

abstract class Database {
  Future<void> initialize();

  Future<void> saveFilmsItems(List<FilmsItem> items);
  Future<Map<String, FilmsItem?>> getFilmsItems(List<String> ids);

  Future<void> saveSpeciesItems(List<SpeciesItem> items);
  Future<Map<String, SpeciesItem?>> getSpeciesItems(List<String> ids);

  Future<void> savePlanetsItem(List<PlanetsItem> items);
  Future<Map<String, PlanetsItem?>> getPlanetsItems(List<String> ids);

  Future<void> saveStarshipsItems(List<StarshipsItem> items);
  Future<Map<String, StarshipsItem?>> getStarshipsItems(List<String> ids);

  Future<void> saveVehiclesItems(List<VehiclesItem> items);
  Future<Map<String, VehiclesItem?>> getVehiclesItems(List<String> ids);

  Future<void> savePeopleItems(List<PeopleItem> items);
  Future<Map<String, PeopleItem?>> getPeopleItems(List<String> ids);
}
