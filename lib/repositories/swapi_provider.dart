import 'package:flutter/foundation.dart';
import 'package:swtp/models/detailed/films_detailed.dart';
import 'package:swtp/models/detailed/people_detailed.dart';
import 'package:swtp/models/detailed/planet_detailed.dart';
import 'package:swtp/models/detailed/species_detailed.dart';
import 'package:swtp/models/detailed/starships_detailed.dart';
import 'package:swtp/models/detailed/vehicles_detailed.dart';
import 'package:swtp/repositories/database.dart';
import 'package:swapi_dart/swapi_dart.dart';

class SwapiProvider {
  final Database _db;

  const SwapiProvider(Database db) : _db = db;

  Future<PeopleItemDetailed> getPeopleItemDetailed(PeopleItem peopleItem,
      {bool onIsolate = true}) {
    final args = {'item': peopleItem, 'db': _db};
    if (onIsolate) {
      return compute(_getPeopleItemDetailed, args);
    } else {
      return _getPeopleItemDetailed(args);
    }
  }

  static Future<PeopleItemDetailed> _getPeopleItemDetailed(Map args) async {
    final peopleItem = args['item'] as PeopleItem;
    final db = args['db'] as Database;

    final filmsList = await _getFilms(db, peopleItem.filmUrls);
    final speciesList = await _getSpecies(db, peopleItem.specieUrls);
    final starShipsList = await _getStarships(db, peopleItem.starShipUrls);
    final vehiclesList = await _getVehicles(db, peopleItem.vehicleUrls);
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

  Future<FilmsItemDetailed> getFilmsItemDetailed(FilmsItem filmsItem,
      {bool onIsolate = true}) {
    final args = {'item': filmsItem, 'db': _db};
    if (onIsolate) {
      return compute(_getFilmsItemDetailed, args);
    } else {
      return _getFilmsItemDetailed(args);
    }
  }

  static Future<FilmsItemDetailed> _getFilmsItemDetailed(Map args) async {
    final filmsItem = args['item'] as FilmsItem;
    final db = args['db'] as Database;

    final species = await _getSpecies(db, filmsItem.specieUrls);
    final starships = await _getStarships(db, filmsItem.starshipUrls);
    final characters = await _getPeople(db, filmsItem.characterUrls);
    final planets = await _getPlanets(db, filmsItem.planetUrls);
    final vehicles = await _getVehicles(db, filmsItem.vehicleUrls);

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
    final args = {'item': planetsItem, 'db': _db};
    if (onIsolate) {
      return compute(_getPlanetsItemDetailed, args);
    } else {
      return _getPlanetsItemDetailed(args);
    }
  }

  static Future<PlanetsItemDetailed> _getPlanetsItemDetailed(Map args) async {
    final planetsItem = args['item'] as PlanetsItem;
    final db = args['db'] as Database;

    final residents = await _getPeople(db, planetsItem.residentUrls);
    final films = await _getFilms(db, planetsItem.filmUrls);

    return PlanetsItemDetailed(
      swapiItem: planetsItem,
      residents: residents,
      films: films,
    );
  }

  Future<SpeciesItemDetailed> getSpeciesItemsDetailed(SpeciesItem speciesItem,
      {bool onIsolate = true}) {
    final args = {'item': speciesItem, 'db': _db};
    if (onIsolate) {
      return compute(_getSpeciesItemsDetailed, args);
    } else {
      return _getSpeciesItemsDetailed(args);
    }
  }

  static Future<SpeciesItemDetailed> _getSpeciesItemsDetailed(Map args) async {
    final speciesItem = args['item'] as SpeciesItem;
    final db = args['db'] as Database;

    final homeworld = speciesItem.homeworldUrl != null
        ? await _getHomeWorld(db, speciesItem.homeworldUrl!)
        : null;
    final films = await _getFilms(db, speciesItem.filmUrls);
    final people = await _getPeople(db, speciesItem.peopleUrls);

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
    final args = {'item': speciesItem, 'db': _db};
    if (onIsolate) {
      return compute(_getStarshipsItemDetailed, args);
    } else {
      return _getStarshipsItemDetailed(args);
    }
  }

  static Future<StarshipsItemDetailed> _getStarshipsItemDetailed(
      Map args) async {
    final starshipsItem = args['item'] as StarshipsItem;
    final db = args['db'] as Database;

    final films = await _getFilms(db, starshipsItem.filmUrls);
    final pilots = await _getPeople(db, starshipsItem.pilotUrls);

    return StarshipsItemDetailed(
      swapiItem: starshipsItem,
      films: films,
      pilots: pilots,
    );
  }

  Future<VehiclesItemDetailed> getVehiclesItemDetailed(
      VehiclesItem vehiclesItem,
      {bool onIsolate = true}) {
    final args = {'item': vehiclesItem, 'db': _db};
    if (onIsolate) {
      return compute(_getVehiclesItemDetailed, args);
    } else {
      return _getVehiclesItemDetailed(args);
    }
  }

  static Future<VehiclesItemDetailed> _getVehiclesItemDetailed(Map args) async {
    final vehiclesItem = args['item'] as VehiclesItem;
    final db = args['db'] as Database;

    final films = await _getFilms(db, vehiclesItem.filmUrls);
    final pilots = await _getPeople(db, vehiclesItem.pilotUrls);

    return VehiclesItemDetailed(
      swapiItem: vehiclesItem,
      films: films,
      pilots: pilots,
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
      databaseSaver: (films) => db.saveFilmsItems(films, closeAfter: true),
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
      databaseSaver: (items) => db.savePeopleItems(items, closeAfter: true),
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
      databaseSaver: (items) => db.savePlanetsItem(items, closeAfter: true),
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
      databaseSaver: (items) => db.saveSpeciesItems(items, closeAfter: true),
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
      databaseSaver: (items) => db.saveStarshipsItems(items, closeAfter: true),
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
      databaseSaver: (items) => db.saveVehiclesItems(items, closeAfter: true),
    );
  }

  static Future<PlanetsItem> _getHomeWorld(Database db, String id) {
    return _getSingleItem<PlanetsItem>(
      itemId: id,
      databaseItemProvider: (id) =>
          db.getPlanetsItems([id]).then((value) => value[id]),
      networkItemProvider: (id) => Swapi.getPlanetsItem(id),
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
