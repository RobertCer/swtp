import 'package:flutter/material.dart';
import 'package:swtp/models/films.dart';
import 'package:swtp/models/species.dart';
import 'package:swtp/models/starships.dart';
import 'package:swtp/models/vehicles.dart';
import 'package:swtp/repositories/database.dart';
import 'package:swtp/repositories/swapi.dart';

class SwapiProvider {
  final Database db;

  const SwapiProvider(this.db);

  Future<FilmsItem> getFilmsItem(String url) async {
    var item = await db.getFilmsItem(url);

    if (item == null) {
      item = await Swapi.getFilmsItem(url);
      await db.saveFilmsItem(item);
      debugPrint('Fetched from remote and saved to database $item');
    } else {
      debugPrint('Fetched from database $item');
    }

    return item;
  }

  Future<VehiclesItem> getVehiclesItem(String url) async {
    var item = await db.getVehiclesItem(url);

    if (item == null) {
      item = await Swapi.getVehiclesItem(url);
      await db.saveVehiclesItem(item);
      debugPrint('Fetched from remote and saved to database $item');
    } else {
      debugPrint('Fetched from database $item');
    }

    return item;
  }

  Future<SpeciesItem> getSpeciesItem(String url) async {
    var item = await db.getSpeciesItem(url);

    if (item == null) {
      item = await Swapi.getSpeciesItem(url);
      await db.saveSpeciesItem(item);
      debugPrint('Fetched from remote and saved to database $item');
    } else {
      debugPrint('Fetched from database $item');
    }

    return item;
  }

  Future<StarshipsItem> getStarshipsItem(String url) async {
    var item = await db.getStarshipsItem(url);

    if (item == null) {
      item = await Swapi.getStarshipsItem(url);
      await db.saveStarshipsItem(item);
      debugPrint('Fetched from remote and saved to database $item');
    } else {
      debugPrint('Fetched from database $item');
    }

    return item;
  }
}
