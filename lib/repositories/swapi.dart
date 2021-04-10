import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:swtp/models/films.dart';
import 'package:swtp/models/people.dart';
import 'package:swtp/models/planet.dart';
import 'package:swtp/models/species.dart';
import 'package:swtp/models/starships.dart';
import 'package:swtp/models/vehicles.dart';

class Swapi {
  static const String _baseUrl = 'https://swapi.dev/api/';
  static const String _resourcePeople = 'people/';
  static const String _resourceSpecies = 'species/';
  static const String _resourcePlanets = 'planets/';
  static const String _resourceStarships = 'starships/';
  static const String _resourceVehicles = 'vehicles/';

  static Future<List<PeopleItem>> searchAllPeople(String name,
      {bool onIsolate = true}) {
    if (onIsolate) {
      return compute(_searchAllPeople, name);
    } else {
      return _searchAllPeople(name);
    }
  }

  static Future<People> _searchSinglePeople(String name) async {
    final httpClient = http.Client();
    final urlRequest = Uri.parse(_baseUrl + _resourcePeople + '?search=$name');

    final response = await httpClient.get(urlRequest);
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200) {
      final map = json.decode(responseBody);
      return People(map);
    }
    throw Exception('code: ${response.statusCode}, message: $responseBody');
  }

  static Future<List<PeopleItem>> _searchAllPeople(String name) async {
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

  static Future<PeopleItem> getPeopleItem(String url,
      {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return PeopleItem(map);
  }

  static Future<People> getPeople(String url, {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return People(map);
  }

  static Future<FilmsItem> getFilmsItem(String url,
      {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return FilmsItem(map);
  }

  static Future<Films> getFilms(String url, {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return Films(map);
  }

  static Future<Planets> getPlanets(String url,
      {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return Planets(map);
  }

  static Future<PlanetsItem> getPlanetsItem(String url,
      {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return PlanetsItem(map);
  }

  static Future<SpeciesItem> getSpeciesItem(String url,
      {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return SpeciesItem(map);
  }

  static Future<Species> getSpecies(String url,
      {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return Species(map);
  }

  static Future<VehiclesItem> getVehiclesItem(String url,
      {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return VehiclesItem(map);
  }

  static Future<Vehicles> getVehicles(String url,
      {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return Vehicles(map);
  }

  static Future<StarshipsItem> getStarshipsItem(String url,
      {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return StarshipsItem(map);
  }

  static Future<Starships> getStarships(String url,
      {bool forceHttps = true}) async {
    final map = await _makeRequest(url, forceHttps);
    return Starships(map);
  }

  static Future<Map> _makeRequest(
    String url,
    bool forceHttps,
  ) {
    final httpClient = http.Client();
    final urlRequest =
        Uri.parse(forceHttps ? url.replaceAll('http:', 'https:') : url);
    return httpClient.get(urlRequest).then((response) {
      final responseBody = utf8.decode(response.bodyBytes);
      if (response.statusCode == 200) {
        return json.decode(responseBody);
      }
      throw ('code: ${response.statusCode}, message: $responseBody');
    });
  }
}
