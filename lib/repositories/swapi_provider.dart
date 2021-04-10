import 'package:flutter/foundation.dart';
import 'package:swtp/models/detailed/people_detailed.dart';
import 'package:swtp/models/films.dart';
import 'package:swtp/models/people.dart';
import 'package:swtp/models/planet.dart';
import 'package:swtp/models/species.dart';
import 'package:swtp/models/starships.dart';
import 'package:swtp/models/vehicles.dart';
import 'package:swtp/repositories/database.dart';
import 'package:swtp/repositories/swapi.dart';

class SwapiProvider {
  final Database _db;

  const SwapiProvider(Database db) : _db = db;

  Future<PeopleItemDetailed> getPeopleItemDetailed(PeopleItem peopleItem,
      {bool onIsolate = true}) {
    final args = {'peopleItem': peopleItem, 'db': _db};
    if (onIsolate) {
      return compute(_getPeopleItemDetailed, args);
    } else {
      return _getPeopleItemDetailed(args);
    }
  }

  static Future<PeopleItemDetailed> _getPeopleItemDetailed(Map args) async {
    final peopleItem = args['peopleItem'] as PeopleItem;
    final db = args['db'] as Database;

    final filmsList = await _getFilms(db, peopleItem.filmUrls);
    final speciesList = <SpeciesItem>[];
    final starShipsList = <StarshipsItem>[];
    final vehiclesList = <VehiclesItem>[];
    final homeWorld = await _getHomeWorld(db, peopleItem.homeWorldUrl);

    return PeopleItemDetailed(
      peopleItem: peopleItem,
      filmsList: filmsList,
      speciesList: speciesList,
      starShipsList: starShipsList,
      vehiclesList: vehiclesList,
      homeWorld: homeWorld,
    );
  }

  static Future<List<FilmsItem>> _getFilms(
    Database db,
    List<String> filmIds,
  ) async {
    return _getMultipleItems<FilmsItem>(
      itemIds: filmIds,
      databaseItemProvider: (ids) => db.getFilmsItems(ids),
      networkItemProvider: (id) => Swapi.getFilmsItem(id),
      databaseSaver: (films) => db.saveFilmsItems(films),
    );
  }

  static Future<List<PeopleItem>> _getPeople(
    Database db,
    List<String> peopleIds,
  ) async {
    return _getMultipleItems<PeopleItem>(
      itemIds: peopleIds,
      databaseItemProvider: (ids) => db.getPeopleItems(ids),
      networkItemProvider: (id) => Swapi.getPeopleItem(id),
      databaseSaver: (items) => db.savePeopleItems(items),
    );
  }

  static Future<List<PlanetsItem>> _getPlanets(
    Database db,
    List<String> planetIds,
  ) async {
    return _getMultipleItems<PlanetsItem>(
      itemIds: planetIds,
      databaseItemProvider: (ids) => db.getPlanetsItems(ids),
      networkItemProvider: (id) => Swapi.getPlanetsItem(id),
      databaseSaver: (items) => db.savePlanetsItem(items),
    );
  }

  static Future<List<SpeciesItem>> _getSpecies(
    Database db,
    List<String> speciesIds,
  ) async {
    return _getMultipleItems<SpeciesItem>(
      itemIds: speciesIds,
      databaseItemProvider: (ids) => db.getSpeciesItems(ids),
      networkItemProvider: (id) => Swapi.getSpeciesItem(id),
      databaseSaver: (items) => db.saveSpeciesItems(items),
    );
  }

  static Future<List<StarshipsItem>> _getStarships(
    Database db,
    List<String> starshipIds,
  ) async {
    return _getMultipleItems<StarshipsItem>(
      itemIds: starshipIds,
      databaseItemProvider: (ids) => db.getStarshipsItems(ids),
      networkItemProvider: (id) => Swapi.getStarshipsItem(id),
      databaseSaver: (items) => db.saveStarshipsItems(items),
    );
  }

  static Future<List<VehiclesItem>> _getVehicles(
    Database db,
    List<String> vehicleIds,
  ) async {
    return _getMultipleItems<VehiclesItem>(
      itemIds: vehicleIds,
      databaseItemProvider: (ids) => db.getVehiclesItems(ids),
      networkItemProvider: (id) => Swapi.getVehiclesItem(id),
      databaseSaver: (items) => db.saveVehiclesItems(items),
    );
  }

  static Future<PlanetsItem> _getHomeWorld(Database db, String id) {
    return _getSingleItem<PlanetsItem>(
      itemId: id,
      databaseItemProvider: (id) =>
          db.getPlanetsItems([id]).then((value) => value[id]),
      networkItemProvider: (id) => Swapi.getPlanetsItem(id),
      databaseSaver: (items) => db.savePlanetsItem(items),
    );
  }

  static Future<List<T>> _getMultipleItems<T>({
    required List<String> itemIds,
    required MaybeMultipleItemProvider<T> databaseItemProvider,
    required SingleItemProvider<T> networkItemProvider,
    required DatabaseSaver<T> databaseSaver,
  }) async {
    final items = <T>[];
    final map = await databaseItemProvider(itemIds);
    final missingItems = <Future<T>>[];
    map.forEach((key, value) {
      if (value == null) {
        missingItems.add(networkItemProvider(key));
      } else {
        items.add(value);
      }
    });
    if (missingItems.isNotEmpty) {
      final additionalItems = await Future.wait(missingItems);
      await databaseSaver(additionalItems);
      items.addAll(additionalItems);
    }
    return items;
  }

  static Future<T> _getSingleItem<T>({
    required String itemId,
    required MaybeSingleItemProvider<T> databaseItemProvider,
    required SingleItemProvider<T> networkItemProvider,
    required DatabaseSaver<T> databaseSaver,
  }) async {
    final item = await databaseItemProvider(itemId);
    if (item == null) {
      final additionalItem = await networkItemProvider(itemId);
      await databaseSaver([additionalItem]);
      return additionalItem;
    } else {
      return item;
    }
  }
}

typedef MaybeMultipleItemProvider<T> = Future<Map<String, T?>> Function(
    List<String>);

typedef MaybeSingleItemProvider<T> = Future<T?> Function(String);

typedef SingleItemProvider<T> = Future<T> Function(String);

typedef DatabaseSaver<T> = Future<void> Function(List<T>);
