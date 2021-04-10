import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:swtp/models/films.dart';
import 'package:swtp/models/people.dart';
import 'package:swtp/models/planet.dart';
import 'package:swtp/models/species.dart';
import 'package:swtp/models/starships.dart';
import 'package:swtp/models/vehicles.dart';

import 'database.dart';

class HiveDatabase extends Database {
  static const _filmsItemsBoxName = 'filmsItems';
  static const _peopleItemsBoxName = 'peopleItems';
  static const _planetsItemsBoxName = 'planetsItems';
  static const _speciesItemsBoxName = 'speciesItems';
  static const _starshipsItemsBoxName = 'starshipsItems';
  static const _vehiclesItemsBoxName = 'vehiclesItems';

  HiveDatabase() : _hive = Hive;

  final HiveInterface _hive;

  Future<Box<FilmsItem>> _openFilmsBox() =>
      _hive.openBox<FilmsItem>(_filmsItemsBoxName);

  Future<Box<PeopleItem>> _openPeopleBox() =>
      _hive.openBox<PeopleItem>(_peopleItemsBoxName);

  Future<Box<PlanetsItem>> _openPlanetsBox() =>
      _hive.openBox<PlanetsItem>(_planetsItemsBoxName);

  Future<Box<SpeciesItem>> _openSpeciesBox() =>
      _hive.openBox<SpeciesItem>(_speciesItemsBoxName);

  Future<Box<StarshipsItem>> _openStarshipBox() =>
      _hive.openBox<StarshipsItem>(_starshipsItemsBoxName);

  Future<Box<VehiclesItem>> _openVehiclesBox() =>
      _hive.openBox<VehiclesItem>(_vehiclesItemsBoxName);

  @override
  Future<void> initialize() async {
    await _hive.initFlutter();
    _hive.registerAdapter(FilmsItemAdapter(), override: true);
    _hive.registerAdapter(PeopleItemAdapter(), override: true);
    _hive.registerAdapter(PlanetsItemAdapter(), override: true);
    _hive.registerAdapter(SpeciesItemAdapter(), override: true);
    _hive.registerAdapter(StarshipsItemAdapter(), override: true);
    _hive.registerAdapter(VehiclesItemAdapter(), override: true);
  }

  @override
  Future<void> saveFilmsItems(List<FilmsItem> filmsItems) async {
    final box = await _openFilmsBox();
    await Future.wait(
      filmsItems.map((element) => box.put(element.url, element)),
    );
  }

  @override
  Future<void> savePeopleItems(List<PeopleItem> items) async {
    final box = await _openPeopleBox();
    await Future.wait(
      items.map((element) => box.put(element.url, element)),
    );
  }

  @override
  Future<void> savePlanetsItem(List<PlanetsItem> items) async {
    final box = await _openPlanetsBox();
    await Future.wait(
      items.map((element) => box.put(element.url, element)),
    );
  }

  @override
  Future<void> saveSpeciesItems(List<SpeciesItem> items) async {
    final box = await _openSpeciesBox();
    await Future.wait(
      items.map((element) => box.put(element.url, element)),
    );
  }

  @override
  Future<void> saveStarshipsItems(List<StarshipsItem> items) async {
    final box = await _openStarshipBox();
    await Future.wait(
      items.map((element) => box.put(element.url, element)),
    );
  }

  @override
  Future<void> saveVehiclesItems(List<VehiclesItem> items) async {
    final box = await _openVehiclesBox();
    await Future.wait(
      items.map((element) => box.put(element.url, element)),
    );
  }

  @override
  Future<Map<String, FilmsItem?>> getFilmsItems(List<String> ids) =>
      _getItems(ids, boxProvider: _openFilmsBox);

  @override
  Future<Map<String, PeopleItem?>> getPeopleItems(List<String> ids) =>
      _getItems(ids, boxProvider: _openPeopleBox);

  @override
  Future<Map<String, PlanetsItem?>> getPlanetsItems(List<String> ids) =>
      _getItems(ids, boxProvider: _openPlanetsBox);

  @override
  Future<Map<String, SpeciesItem?>> getSpeciesItems(List<String> ids) =>
      _getItems(ids, boxProvider: _openSpeciesBox);

  @override
  Future<Map<String, StarshipsItem?>> getStarshipsItems(List<String> ids) =>
      _getItems(ids, boxProvider: _openStarshipBox);

  @override
  Future<Map<String, VehiclesItem?>> getVehiclesItems(List<String> ids) =>
      _getItems(ids, boxProvider: _openVehiclesBox);

  Future<Map<String, T?>> _getItems<T>(
    ids, {
    required BoxProvider<T> boxProvider,
  }) async {
    final box = await boxProvider();
    final map = <String, T?>{};
    ids.forEach((id) => map[id] = box.get(id));
    return map;
  }
}

typedef BoxProvider<T> = Future<Box<T>> Function();
