import 'package:swapi_dart/models/vehicles.dart';
import 'package:swapi_dart/models/starships.dart';
import 'package:swapi_dart/models/species.dart';
import 'package:swapi_dart/models/planet.dart';
import 'package:swapi_dart/models/people.dart';
import 'package:swapi_dart/models/films.dart';
import 'package:swapi_dart/swapi_api.dart';

class SwapiStub implements Swapi {
  static final List<PeopleItem> _allPeople = [
    PeopleItem(
      url: 'url',
      name: 'Luke Skywalker',
      birthYear: '15BBY',
      eyeColor: 'brown',
      gender: 'male',
      hairColor: 'brown',
      height: '183',
      mass: '78',
      skinColor: 'skinColor',
      homeWorldUrl: 'homeWorldUrl',
      created: 'created',
      edited: 'edited',
      filmUrls: [],
      specieUrls: [],
      starShipUrls: [],
      vehicleUrls: [],
    ),
    PeopleItem(
      url: 'url',
      name: 'Anakin Skywalker',
      birthYear: '55BBY',
      eyeColor: 'brown',
      gender: 'male',
      hairColor: 'brown',
      height: '205',
      mass: '160',
      skinColor: 'skinColor',
      homeWorldUrl: 'homeWorldUrl',
      created: 'created',
      edited: 'edited',
      filmUrls: [],
      specieUrls: [],
      starShipUrls: [],
      vehicleUrls: [],
    ),
  ];

  @override
  Future<Films> getFilms(String url, {bool forceHttps = true}) async {
    final results = <FilmsItem>[];
    return Films(
      results: results,
      count: results.length,
      next: null,
      previous: null,
    );
  }

  @override
  Future<FilmsItem> getFilmsItem(String url, {bool forceHttps = true}) async {
    return FilmsItem(
      url: 'url',
      title: 'A new hope',
      episodeId: 1,
      openingCrawl: 'A long text',
      director: 'George Lucas',
      producer: 'George Lucas',
      releaseDate: '1977',
      specieUrls: [],
      starshipUrls: [],
      vehicleUrls: [],
      characterUrls: [],
      planetUrls: [],
      created: 'created',
      edited: 'edited',
    );
  }

  @override
  Future<People> getPeople(String url, {bool forceHttps = true}) async {
    final results = <PeopleItem>[..._allPeople];
    return People(results: results, count: results.length);
  }

  @override
  Future<PeopleItem> getPeopleItem(String url, {bool forceHttps = true}) async {
    return _allPeople[url.length % 2];
  }

  @override
  Future<Planets> getPlanets(String url, {bool forceHttps = true}) async {
    final results = <PlanetsItem>[];
    return Planets(results: results, count: results.length);
  }

  @override
  Future<PlanetsItem> getPlanetsItem(String url,
      {bool forceHttps = true}) async {
    return PlanetsItem(
      url: 'url',
      name: 'name',
      diameter: 'diameter',
      rotationPeriod: 'rotationPeriod',
      orbitalPeriod: 'orbitalPeriod',
      gravity: 'gravity',
      population: 'population',
      climate: 'climate',
      terrain: 'terrain',
      surfaceWater: 'surfaceWater',
      created: 'created',
      edited: 'edited',
      residentUrls: [],
      filmUrls: [],
    );
  }

  @override
  Future<Species> getSpecies(String url, {bool forceHttps = true}) async {
    final results = <SpeciesItem>[];
    return Species(results: results, count: results.length);
  }

  @override
  Future<SpeciesItem> getSpeciesItem(String url,
      {bool forceHttps = true}) async {
    return SpeciesItem(
      url: 'url',
      name: 'Human',
      classification: 'classification',
      designation: 'designation',
      averageHeight: 'averageHeight',
      averageLifespan: 'averageLifespan',
      eyeColors: 'eyeColors',
      hairColors: 'hairColors',
      skinColors: 'skinColors',
      language: 'language',
      peopleUrls: [],
      filmUrls: [],
      created: 'created',
      edited: 'edited',
    );
  }

  @override
  Future<Starships> getStarships(String url, {bool forceHttps = true}) async {
    final results = <StarshipsItem>[];
    return Starships(results: results, count: results.length);
  }

  @override
  Future<StarshipsItem> getStarshipsItem(String url,
      {bool forceHttps = true}) async {
    return StarshipsItem(
        url: 'url',
        name: 'name',
        model: 'model',
        starshipClass: 'starshipClass',
        manufacturer: 'manufacturer',
        costInCredits: 'costInCredits',
        length: 'length',
        crew: 'crew',
        passengers: 'passengers',
        maxAtmospheringSpeed: 'maxAtmospheringSpeed',
        hyperdriveRating: 'hyperdriveRating',
        mglt: 'mglt',
        cargoCapacity: 'cargoCapacity',
        consumables: 'consumables',
        filmUrls: [],
        pilotUrls: [],
        created: 'created',
        edited: 'edited,');
  }

  @override
  Future<Vehicles> getVehicles(String url, {bool forceHttps = true}) async {
    final results = <VehiclesItem>[];
    return Vehicles(results: results, count: results.length);
  }

  @override
  Future<VehiclesItem> getVehiclesItem(String url,
      {bool forceHttps = true}) async {
    return VehiclesItem(
      url: 'url',
      name: 'name',
      model: 'model',
      vehicleClass: 'vehicleClass',
      manufacturer: 'manufacturer',
      length: 'length',
      costInCredits: 'costInCredits',
      crew: 'crew',
      passengers: 'passengers',
      maxAtmospheringSpeed: 'maxAtmospheringSpeed',
      cargoCapacity: 'cargoCapacity',
      consumables: 'consumables',
      filmUrls: [],
      pilotUrls: [],
      created: 'created',
      edited: 'edited',
    );
  }

  @override
  Future<List<PeopleItem>> searchAllPeople(String name) async {
    await Future.delayed(Duration(milliseconds: 2000));
    return <PeopleItem>[
      ..._allPeople,
      ..._allPeople,
      ..._allPeople,
      ..._allPeople,
      ..._allPeople,
      ..._allPeople,
      ..._allPeople,
    ];
  }
}
