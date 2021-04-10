import 'dart:convert';

import 'response_list.dart';
import 'swapi_item.dart';

/// A Planet resource is a large mass, planet or planetoid in the Star Wars Universe, at the time of 0 ABY.
class PlanetsItem extends SwapiItem {
  late String name;
  late String diameter;
  late String rotationPeriod;
  late String orbitalPeriod;
  late String gravity;
  late String population;
  late String climate;
  late String terrain;
  late String surfaceWater;
  late String created;
  late String edited;

  late List<String> residentUrls;
  late List<String> filmUrls;

  PlanetsItem(Map map) {
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

    if (map.containsKey('url') && map['url'] is String) {
      url = map['url'];
    } else {
      throw FormatException('url invalid or missing');
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

    filmUrls = <String>[];
    if (map.containsKey('films') && map['films'] is List) {
      for (var i = 0; i < map['films'].length; i++) {
        filmUrls.add(map['films'][i]);
      }
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'diameter': diameter,
      'rotation_period': rotationPeriod,
      'orbital_period': orbitalPeriod,
      'gravity': gravity,
      'population': population,
      'climate': climate,
      'terrain': terrain,
      'surface_water': surfaceWater,
      'url': url,
      'created': created,
      'edited': edited,
      'residents': residentUrls,
      'films': filmUrls,
    };
  }

  String toJson() => json.encode(toMap());

  factory PlanetsItem.fromJson(String source) =>
      PlanetsItem(json.decode(source));
}

/// Collection of PlanetsItem
class Planets extends ResponseList {
  List<PlanetsItem> results;

  Planets(Map map)
      : results = ResponseList.parseResults<PlanetsItem>(
          map,
          constructor: (map) => PlanetsItem(map),
        ),
        super(map);
}
