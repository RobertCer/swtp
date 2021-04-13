import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swapi_dart/swapi_dart.dart';

import 'models/films.dart';
import 'models/people.dart';
import 'models/planet.dart';
import 'models/species.dart';
import 'models/starships.dart';
import 'models/vehicles.dart';

abstract class Swapi {
  const Swapi._();

  static late final Swapi _instance = SwapiImpl();
  static Swapi get instance => _instance;

  Future<List<PeopleItem>> searchAllPeople(String name);

  Future<PeopleItem> getPeopleItem(String url, {bool forceHttps = true});
  Future<People> getPeople(String url, {bool forceHttps = true});

  Future<FilmsItem> getFilmsItem(String url, {bool forceHttps = true});
  Future<Films> getFilms(String url, {bool forceHttps = true});

  Future<Planets> getPlanets(String url, {bool forceHttps = true});
  Future<PlanetsItem> getPlanetsItem(String url, {bool forceHttps = true});

  Future<SpeciesItem> getSpeciesItem(String url, {bool forceHttps = true});
  Future<Species> getSpecies(String url, {bool forceHttps = true});

  Future<VehiclesItem> getVehiclesItem(String url, {bool forceHttps = true});
  Future<Vehicles> getVehicles(String url, {bool forceHttps = true});

  Future<StarshipsItem> getStarshipsItem(String url, {bool forceHttps = true});
  Future<Starships> getStarships(String url, {bool forceHttps = true});
}

class SwapiImpl implements Swapi {
  static const String _baseUrl = 'https://swapi.dev/api/';
  static const String _resourcePeople = 'people/';

  @override
  Future<List<PeopleItem>> searchAllPeople(String name) {
    return _searchAllPeople(name);
  }

  static Future<People> _searchSinglePeople(String name) async {
    final httpClient = http.Client();
    final urlRequest = Uri.parse(_baseUrl + _resourcePeople + '?search=$name');

    final response = await httpClient.get(urlRequest);
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200) {
      final map = json.decode(responseBody);
      return People.fromMap(map);
    } else {
      throw SwapiException(
        message: responseBody,
        responseCode: response.statusCode,
      );
    }
  }

  Future<List<PeopleItem>> _searchAllPeople(String name) async {
    final list = <PeopleItem>[];

    var people = await _searchSinglePeople(name);

    list.addAll(people.results);

    while (people.next != null) {
      people = await getPeople(people.next!.replaceAll('http:', 'https:'));
      list.addAll(people.results);
    }

    list.sort((a, b) => a.name.compareTo(b.name));

    return list;
  }

  @override
  Future<PeopleItem> getPeopleItem(String url, {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return PeopleItem.fromMap(map);
  }

  @override
  Future<People> getPeople(String url, {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return People.fromMap(map);
  }

  @override
  Future<FilmsItem> getFilmsItem(String url, {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return FilmsItem.fromMap(map);
  }

  @override
  Future<Films> getFilms(String url, {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return Films.fromMap(map);
  }

  @override
  Future<Planets> getPlanets(String url, {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return Planets.fromMap(map);
  }

  @override
  Future<PlanetsItem> getPlanetsItem(String url,
      {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return PlanetsItem.fromMap(map);
  }

  @override
  Future<SpeciesItem> getSpeciesItem(String url,
      {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return SpeciesItem.fromMap(map);
  }

  @override
  Future<Species> getSpecies(String url, {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return Species.fromMap(map);
  }

  @override
  Future<VehiclesItem> getVehiclesItem(String url,
      {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return VehiclesItem.fromMap(map);
  }

  @override
  Future<Vehicles> getVehicles(String url, {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return Vehicles.fromMap(map);
  }

  @override
  Future<StarshipsItem> getStarshipsItem(String url,
      {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return StarshipsItem.fromMap(map);
  }

  @override
  Future<Starships> getStarships(String url, {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return Starships.fromMap(map);
  }

  static Future<Map> _makeRequest(
    String url,
    bool forceHttps,
  ) {
    final httpClient = http.Client();
    final urlRequest = Uri.parse(
      forceHttps ? url.replaceAll('http:', 'https:') : url,
    );
    return httpClient.get(urlRequest).then((response) {
      final responseBody = utf8.decode(response.bodyBytes);
      if (response.statusCode == 200) {
        return json.decode(responseBody);
      } else {
        throw SwapiException(
          message: responseBody,
          responseCode: response.statusCode,
        );
      }
    });
  }
}
