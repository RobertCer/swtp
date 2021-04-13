import 'dart:convert';

import 'response_list.dart';
import 'swapi_item.dart';

class PlanetsItem extends SwapiItem {
  late final String name;
  late final String diameter;
  late final String rotationPeriod;
  late final String orbitalPeriod;
  late final String gravity;
  late final String population;
  late final String climate;
  late final String terrain;
  late final String surfaceWater;
  late final String created;
  late final String edited;
  late final List<String> residentUrls;
  late final List<String> filmUrls;

  PlanetsItem({
    required String url,
    required this.name,
    required this.diameter,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.gravity,
    required this.population,
    required this.climate,
    required this.terrain,
    required this.surfaceWater,
    required this.created,
    required this.edited,
    required this.residentUrls,
    required this.filmUrls,
  }) : super(url: url);

  PlanetsItem.fromMap(Map map) : super.fromMap(map) {
    if (map.containsKey('name') && map['name'] is String) {
      name = map['name'];
    } else {
      throw FormatException('name invalid or missing');
    }

    if (map.containsKey('diameter') && map['diameter'] is String) {
      diameter = map['diameter'];
    } else {
      throw FormatException('diameter invalid or missing');
    }

    if (map.containsKey('rotation_period') &&
        map['rotation_period'] is String) {
      rotationPeriod = map['rotation_period'];
    } else {
      throw FormatException('rotation_period invalid or missing');
    }

    if (map.containsKey('orbital_period') && map['orbital_period'] is String) {
      orbitalPeriod = map['orbital_period'];
    } else {
      throw FormatException('orbital_period invalid or missing');
    }

    if (map.containsKey('gravity') && map['gravity'] is String) {
      gravity = map['gravity'];
    } else {
      throw FormatException('gravity invalid or missing');
    }

    if (map.containsKey('population') && map['population'] is String) {
      population = map['population'];
    } else {
      throw FormatException('population invalid or missing');
    }

    if (map.containsKey('climate') && map['climate'] is String) {
      climate = map['climate'];
    } else {
      throw FormatException('climate invalid or missing');
    }

    if (map.containsKey('terrain') && map['terrain'] is String) {
      terrain = map['terrain'];
    } else {
      throw FormatException('terrain invalid or missing');
    }

    if (map.containsKey('surface_water') && map['surface_water'] is String) {
      surfaceWater = map['surface_water'];
    } else {
      throw FormatException('surface_water invalid or missing');
    }

    if (map.containsKey('created') && map['created'] is String) {
      created = map['created'];
    } else {
      throw FormatException('created invalid or missing');
    }

    if (map.containsKey('edited') && map['edited'] is String) {
      edited = map['edited'];
    } else {
      throw FormatException('edited invalid or missing');
    }

    filmUrls = <String>[];
    if (map.containsKey('films') && map['films'] is List) {
      for (var i = 0; i < map['films'].length; i++) {
        filmUrls.add(map['films'][i]);
      }
    }

    residentUrls = <String>[];
    if (map.containsKey('residents') && map['residents'] is List) {
      for (var i = 0; i < map['residents'].length; i++) {
        residentUrls.add(map['residents'][i]);
      }
    }
  }

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll({
        'name': name,
        'diameter': diameter,
        'rotation_period': rotationPeriod,
        'orbital_period': orbitalPeriod,
        'gravity': gravity,
        'population': population,
        'climate': climate,
        'terrain': terrain,
        'surface_water': surfaceWater,
        'created': created,
        'edited': edited,
        'residents': residentUrls,
        'films': filmUrls,
      });
  }

  String toJson() => json.encode(toMap());

  factory PlanetsItem.fromJson(String source) =>
      PlanetsItem.fromMap(json.decode(source));
}

class Planets extends ResponseList {
  final List<PlanetsItem> results;

  Planets({
    required this.results,
    required int count,
    String? next,
    String? previous,
  }) : super(
          count: count,
          next: next,
          previous: previous,
        );

  Planets.fromMap(Map map)
      : results = ResponseList.parseResults<PlanetsItem>(
          map,
          constructor: (map) => PlanetsItem.fromMap(map),
        ),
        super.fromMap(map);
}
