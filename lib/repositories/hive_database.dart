import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:swapi_dart/swapi_dart.dart';
import 'package:swtp/models/adapters/films_item_adapter.dart';
import 'package:swtp/models/adapters/people_item_adapter.dart';
import 'package:swtp/models/adapters/planet_item_adapter.dart';
import 'package:swtp/models/adapters/species_item_adapter.dart';
import 'package:swtp/models/adapters/starships_item_adapter.dart';
import 'package:swtp/models/adapters/vehicles_item_adapter.dart';

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
  Future<void> saveFilmsItems(List<FilmsItem> filmsItems,
      {bool closeAfter = false}) async {
    final box = await _openFilmsBox();
    await Future.wait(
      filmsItems.map((element) => box.put(element.url, element)),
    );
    if (closeAfter) {
      await box.close();
    }
  }

  @override
  Future<void> savePeopleItems(List<PeopleItem> items,
      {bool closeAfter = false}) async {
    final box = await _openPeopleBox();
    await Future.wait(
      items.map((element) => box.put(element.url, element)),
    );
    if (closeAfter) {
      await box.close();
    }
  }

  @override
  Future<void> savePlanetsItem(List<PlanetsItem> items,
      {bool closeAfter = false}) async {
    final box = await _openPlanetsBox();
    await Future.wait(
      items.map((element) => box.put(element.url, element)),
    );
    if (closeAfter) {
      await box.close();
    }
  }

  @override
  Future<void> saveSpeciesItems(List<SpeciesItem> items,
      {bool closeAfter = false}) async {
    final box = await _openSpeciesBox();
    await Future.wait(
      items.map((element) => box.put(element.url, element)),
    );
    if (closeAfter) {
      await box.close();
    }
  }

  @override
  Future<void> saveStarshipsItems(List<StarshipsItem> items,
      {bool closeAfter = false}) async {
    final box = await _openStarshipBox();
    await Future.wait(
      items.map((element) => box.put(element.url, element)),
    );
    if (closeAfter) {
      await box.close();
    }
  }

  @override
  Future<void> saveVehiclesItems(List<VehiclesItem> items,
      {bool closeAfter = false}) async {
    final box = await _openVehiclesBox();
    await Future.wait(
      items.map((element) => box.put(element.url, element)),
    );
    if (closeAfter) {
      await box.close();
    }
  }

  @override
  Future<Map<String, FilmsItem?>> getFilmsItems(List<String> ids,
          {bool closeAfter = false}) =>
      _getItems(ids, boxProvider: _openFilmsBox, closeAfter: closeAfter);

  @override
  Future<Map<String, PeopleItem?>> getPeopleItems(List<String> ids,
          {bool closeAfter = false}) =>
      _getItems(ids, boxProvider: _openPeopleBox, closeAfter: closeAfter);

  @override
  Future<Map<String, PlanetsItem?>> getPlanetsItems(List<String> ids,
          {bool closeAfter = false}) =>
      _getItems(ids, boxProvider: _openPlanetsBox, closeAfter: closeAfter);

  @override
  Future<Map<String, SpeciesItem?>> getSpeciesItems(List<String> ids,
          {bool closeAfter = false}) =>
      _getItems(ids, boxProvider: _openSpeciesBox, closeAfter: closeAfter);

  @override
  Future<Map<String, StarshipsItem?>> getStarshipsItems(List<String> ids,
          {bool closeAfter = false}) =>
      _getItems(ids, boxProvider: _openStarshipBox, closeAfter: closeAfter);

  @override
  Future<Map<String, VehiclesItem?>> getVehiclesItems(List<String> ids,
          {bool closeAfter = false}) =>
      _getItems(ids, boxProvider: _openVehiclesBox, closeAfter: closeAfter);

  Future<Map<String, T?>> _getItems<T>(
    ids, {
    required BoxProvider<T> boxProvider,
    bool closeAfter = false,
  }) async {
    final box = await boxProvider();
    final map = <String, T?>{};
    ids.forEach((id) => map[id] = box.get(id));
    if (closeAfter) {
      await box.close();
    }
    return map;
  }
}

typedef BoxProvider<T> = Future<Box<T>> Function();
