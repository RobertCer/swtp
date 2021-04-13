import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:swapi_dart/swapi_dart.dart';

import 'package:swtp/models/detailed/films_detailed.dart';
import 'package:swtp/models/detailed/people_detailed.dart';
import 'package:swtp/models/detailed/planet_detailed.dart';
import 'package:swtp/models/detailed/species_detailed.dart';
import 'package:swtp/models/detailed/starships_detailed.dart';
import 'package:swtp/models/detailed/vehicles_detailed.dart';
import 'package:swtp/repositories/database.dart';

class SwapiProviderException implements Exception {
  final String message;

  SwapiProviderException(this.message);

  @override
  String toString() => message;
}

class SwapiProvider {
  SwapiProvider({
    required Swapi swapi,
    required Database database,
  })   : _swapi = swapi,
        _db = database;

  final Database _db;
  final Swapi _swapi;

  Future<PeopleItemDetailed> getPeopleItemDetailed(PeopleItem peopleItem,
      {bool onIsolate = true}) {
    final args = Args(database: _db, swapi: _swapi, swapiItem: peopleItem);

    if (onIsolate) {
      return compute(_getPeopleItemDetailed, args);
    } else {
      return _getPeopleItemDetailed(args);
    }
  }

  static Future<PeopleItemDetailed> _getPeopleItemDetailed(Args args) async {
    final peopleItem = args.swapiItem as PeopleItem;
    final db = args.database;
    final swapi = args.swapi;

    try {
      final filmsList = await _getFilms(swapi, db, peopleItem.filmUrls);
      final speciesList = await _getSpecies(swapi, db, peopleItem.specieUrls);
      final starShipsList =
          await _getStarships(swapi, db, peopleItem.starShipUrls);
      final vehiclesList =
          await _getVehicles(swapi, db, peopleItem.vehicleUrls);
      final homeWorld = await _getHomeWorld(swapi, db, peopleItem.homeWorldUrl);

      return PeopleItemDetailed(
        peopleItem: peopleItem,
        filmsList: filmsList,
        speciesList: speciesList,
        starShipsList: starShipsList,
        vehiclesList: vehiclesList,
        homeWorld: homeWorld,
      );
    } on SwapiException catch (err) {
      throw SwapiProviderException(err.message);
    }
  }

  Future<FilmsItemDetailed> getFilmsItemDetailed(FilmsItem filmsItem,
      {bool onIsolate = true}) {
    final args = Args(database: _db, swapi: _swapi, swapiItem: filmsItem);

    if (onIsolate) {
      return compute(_getFilmsItemDetailed, args);
    } else {
      return _getFilmsItemDetailed(args);
    }
  }

  static Future<FilmsItemDetailed> _getFilmsItemDetailed(Args args) async {
    final filmsItem = args.swapiItem as FilmsItem;
    final db = args.database;
    final swapi = args.swapi;

    final species = await _getSpecies(swapi, db, filmsItem.specieUrls);
    final starships = await _getStarships(swapi, db, filmsItem.starshipUrls);
    final characters = await _getPeople(swapi, db, filmsItem.characterUrls);
    final planets = await _getPlanets(swapi, db, filmsItem.planetUrls);
    final vehicles = await _getVehicles(swapi, db, filmsItem.vehicleUrls);

    return FilmsItemDetailed(
      swapiItem: filmsItem,
      species: species,
      starships: starships,
      characters: characters,
      planets: planets,
      vehicles: vehicles,
    );
  }

  Future<PlanetsItemDetailed> getPlanetsItemDetailed(PlanetsItem planetsItem,
      {bool onIsolate = true}) {
    final args = Args(database: _db, swapi: _swapi, swapiItem: planetsItem);
    if (onIsolate) {
      return compute(_getPlanetsItemDetailed, args);
    } else {
      return _getPlanetsItemDetailed(args);
    }
  }

  static Future<PlanetsItemDetailed> _getPlanetsItemDetailed(Args args) async {
    final planetsItem = args.swapiItem as PlanetsItem;
    final db = args.database;
    final swapi = args.swapi;

    final residents = await _getPeople(swapi, db, planetsItem.residentUrls);
    final films = await _getFilms(swapi, db, planetsItem.filmUrls);

    return PlanetsItemDetailed(
      swapiItem: planetsItem,
      residents: residents,
      films: films,
    );
  }

  Future<SpeciesItemDetailed> getSpeciesItemsDetailed(SpeciesItem speciesItem,
      {bool onIsolate = true}) {
    final args = Args(database: _db, swapi: _swapi, swapiItem: speciesItem);
    if (onIsolate) {
      return compute(_getSpeciesItemsDetailed, args);
    } else {
      return _getSpeciesItemsDetailed(args);
    }
  }

  static Future<SpeciesItemDetailed> _getSpeciesItemsDetailed(Args args) async {
    final speciesItem = args.swapiItem as SpeciesItem;
    final db = args.database;
    final swapi = args.swapi;

    final homeworld = speciesItem.homeworldUrl != null
        ? await _getHomeWorld(swapi, db, speciesItem.homeworldUrl!)
        : null;
    final films = await _getFilms(swapi, db, speciesItem.filmUrls);
    final people = await _getPeople(swapi, db, speciesItem.peopleUrls);

    return SpeciesItemDetailed(
      swapiItem: speciesItem,
      films: films,
      people: people,
      homeWorld: homeworld,
    );
  }

  Future<StarshipsItemDetailed> getStarshipsItemDetailed(
      StarshipsItem speciesItem,
      {bool onIsolate = true}) {
    final args = Args(database: _db, swapi: _swapi, swapiItem: speciesItem);
    if (onIsolate) {
      return compute(_getStarshipsItemDetailed, args);
    } else {
      return _getStarshipsItemDetailed(args);
    }
  }

  static Future<StarshipsItemDetailed> _getStarshipsItemDetailed(
      Args args) async {
    final starshipsItem = args.swapiItem as StarshipsItem;
    final db = args.database;
    final swapi = args.swapi;

    final films = await _getFilms(swapi, db, starshipsItem.filmUrls);
    final pilots = await _getPeople(swapi, db, starshipsItem.pilotUrls);

    return StarshipsItemDetailed(
      swapiItem: starshipsItem,
      films: films,
      pilots: pilots,
    );
  }

  Future<VehiclesItemDetailed> getVehiclesItemDetailed(
      VehiclesItem vehiclesItem,
      {bool onIsolate = true}) {
    final args = Args(database: _db, swapi: _swapi, swapiItem: vehiclesItem);

    if (onIsolate) {
      return compute(_getVehiclesItemDetailed, args);
    } else {
      return _getVehiclesItemDetailed(args);
    }
  }

  static Future<VehiclesItemDetailed> _getVehiclesItemDetailed(
      Args args) async {
    final vehiclesItem = args.swapiItem as VehiclesItem;
    final db = args.database;
    final swapi = args.swapi;

    final films = await _getFilms(swapi, db, vehiclesItem.filmUrls);
    final pilots = await _getPeople(swapi, db, vehiclesItem.pilotUrls);

    return VehiclesItemDetailed(
      swapiItem: vehiclesItem,
      films: films,
      pilots: pilots,
    );
  }

  static Future<List<FilmsItem>> _getFilms(
    Swapi swapi,
    Database db,
    List<String> filmIds,
  ) async {
    return _getMultipleItems<FilmsItem>(
      itemIds: filmIds,
      databaseItemProvider: (ids) => db.getFilmsItems(ids),
      networkItemProvider: (id) => swapi.getFilmsItem(id),
      databaseSaver: (films) => db.saveFilmsItems(films, closeAfter: true),
    );
  }

  static Future<List<PeopleItem>> _getPeople(
    Swapi swapi,
    Database db,
    List<String> peopleIds,
  ) async {
    return _getMultipleItems<PeopleItem>(
      itemIds: peopleIds,
      databaseItemProvider: (ids) => db.getPeopleItems(ids),
      networkItemProvider: (id) => swapi.getPeopleItem(id),
      databaseSaver: (items) => db.savePeopleItems(items, closeAfter: true),
    );
  }

  static Future<List<PlanetsItem>> _getPlanets(
    Swapi swapi,
    Database db,
    List<String> planetIds,
  ) async {
    return _getMultipleItems<PlanetsItem>(
      itemIds: planetIds,
      databaseItemProvider: (ids) => db.getPlanetsItems(ids),
      networkItemProvider: (id) => swapi.getPlanetsItem(id),
      databaseSaver: (items) => db.savePlanetsItem(items, closeAfter: true),
    );
  }

  static Future<List<SpeciesItem>> _getSpecies(
    Swapi swapi,
    Database db,
    List<String> speciesIds,
  ) async {
    return _getMultipleItems<SpeciesItem>(
      itemIds: speciesIds,
      databaseItemProvider: (ids) => db.getSpeciesItems(ids),
      networkItemProvider: (id) => swapi.getSpeciesItem(id),
      databaseSaver: (items) => db.saveSpeciesItems(items, closeAfter: true),
    );
  }

  static Future<List<StarshipsItem>> _getStarships(
    Swapi swapi,
    Database db,
    List<String> starshipIds,
  ) async {
    return _getMultipleItems<StarshipsItem>(
      itemIds: starshipIds,
      databaseItemProvider: (ids) => db.getStarshipsItems(ids),
      networkItemProvider: (id) => swapi.getStarshipsItem(id),
      databaseSaver: (items) => db.saveStarshipsItems(items, closeAfter: true),
    );
  }

  static Future<List<VehiclesItem>> _getVehicles(
    Swapi swapi,
    Database db,
    List<String> vehicleIds,
  ) async {
    return _getMultipleItems<VehiclesItem>(
      itemIds: vehicleIds,
      databaseItemProvider: (ids) => db.getVehiclesItems(ids),
      networkItemProvider: (id) => swapi.getVehiclesItem(id),
      databaseSaver: (items) => db.saveVehiclesItems(items, closeAfter: true),
    );
  }

  static Future<PlanetsItem> _getHomeWorld(
    Swapi swapi,
    Database db,
    String id,
  ) {
    return _getSingleItem<PlanetsItem>(
      itemId: id,
      databaseItemProvider: (id) =>
          db.getPlanetsItems([id]).then((value) => value[id]),
      networkItemProvider: (id) => swapi.getPlanetsItem(id),
      databaseSaver: (items) => db.savePlanetsItem(items, closeAfter: true),
    );
  }

  static Future<List<T>> _getMultipleItems<T extends SwapiItem>({
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
        // TODO: Ensure internet connection
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

  static Future<T> _getSingleItem<T extends SwapiItem>({
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

class Args {
  Swapi swapi;
  Database database;
  SwapiItem swapiItem;
  Args({
    required this.swapi,
    required this.database,
    required this.swapiItem,
  });
}
