import 'package:flutter/foundation.dart';

import 'response_list.dart';

/// A People resource is an individual person or character within the Star Wars universe.
class PeopleItem {
  late final String name;
  late final String birthYear;
  late final String eyeColor;
  late final String gender;
  late final String hairColor;
  late final String height;
  late final String mass;
  late final String skinColor;
  late final String homeWorld;
  late final String url;
  late final String created;
  late final String edited;

  late final List<String> films;
  late final List<String> species;
  late final List<String> starShips;
  late final List<String> vehicles;

  PeopleItem(Map map) {
    if (map.containsKey('name') && map['name'] is String) {
      name = map['name'];
    } else {
      throw FormatException('invalid name');
    }

    if (map.containsKey('birth_year') && map['birth_year'] is String) {
      birthYear = map['birth_year'];
    } else {
      throw FormatException('invalid birth_year');
    }

    if (map.containsKey('eye_color') && map['eye_color'] is String) {
      eyeColor = map['eye_color'];
    } else {
      throw FormatException('invalid eye_color');
    }

    if (map.containsKey('gender') && map['gender'] is String) {
      gender = map['gender'];
    } else {
      throw FormatException('invalid gender');
    }

    if (map.containsKey('hair_color') && map['hair_color'] is String) {
      hairColor = map['hair_color'];
    } else {
      throw FormatException('invalid hair_color');
    }

    if (map.containsKey('height') && map['height'] is String) {
      height = map['height'];
    } else {
      throw FormatException('invalid height');
    }

    if (map.containsKey('mass') && map['mass'] is String) {
      mass = map['mass'];
    } else {
      throw FormatException('invalid mass');
    }

    if (map.containsKey('skin_color') && map['skin_color'] is String) {
      skinColor = map['skin_color'];
    } else {
      throw FormatException('invalid skin_color');
    }

    if (map.containsKey('homeworld') && map['homeworld'] is String) {
      homeWorld = map['homeworld'];
    } else {
      throw FormatException('invalid homeworld');
    }

    if (map.containsKey('url') && map['url'] is String) {
      url = map['url'];
    } else {
      throw FormatException('invalid url');
    }

    if (map.containsKey('created') && map['created'] is String) {
      created = map['created'];
    } else {
      throw FormatException('invalid created');
    }

    if (map.containsKey('edited') && map['edited'] is String) {
      edited = map['edited'];
    } else {
      throw FormatException('invalid edited');
    }

    films = <String>[];
    if (map.containsKey('films') && map['films'] is List) {
      for (var i = 0; i < map['films'].length; i++) {
        films.add(map['films'][i]);
      }
    }

    species = <String>[];
    if (map.containsKey('species') && map['species'] is List) {
      for (var i = 0; i < map['species'].length; i++) {
        species.add(map['species'][i]);
      }
    }

    starShips = <String>[];
    if (map.containsKey('starships') && map['starships'] is List) {
      for (var i = 0; i < map['starships'].length; i++) {
        starShips.add(map['starships'][i]);
      }
    }

    vehicles = <String>[];
    if (map.containsKey('vehicles') && map['vehicles'] is String) {
      for (var i = 0; i < map['vehicles'].length; i++) {
        vehicles.add(map['vehicles'][i]);
      }
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birth_year': birthYear,
      'eye_color': eyeColor,
      'gender': gender,
      'hair_color': hairColor,
      'height': height,
      'mass': mass,
      'skin_color': skinColor,
      'homeworld': homeWorld,
      'url': url,
      'created': created,
      'edited': edited,
      'films': films,
      'species': species,
      'starships': starShips,
      'vehicles': vehicles,
    };
  }

  @override
  String toString() {
    return 'PeopleItem(name: $name, birthYear: $birthYear, eyeColor: $eyeColor, gender: $gender, hairColor: $hairColor, height: $height, mass: $mass, skinColor: $skinColor, homeworld: $homeWorld, url: $url, created: $created, edited: $edited, films: $films, species: $species, starships: $starShips, vehicles: $vehicles)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PeopleItem &&
        other.name == name &&
        other.birthYear == birthYear &&
        other.eyeColor == eyeColor &&
        other.gender == gender &&
        other.hairColor == hairColor &&
        other.height == height &&
        other.mass == mass &&
        other.skinColor == skinColor &&
        other.homeWorld == homeWorld &&
        other.url == url &&
        other.created == created &&
        other.edited == edited &&
        listEquals(other.films, films) &&
        listEquals(other.species, species) &&
        listEquals(other.starShips, starShips) &&
        listEquals(other.vehicles, vehicles);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        birthYear.hashCode ^
        eyeColor.hashCode ^
        gender.hashCode ^
        hairColor.hashCode ^
        height.hashCode ^
        mass.hashCode ^
        skinColor.hashCode ^
        homeWorld.hashCode ^
        url.hashCode ^
        created.hashCode ^
        edited.hashCode ^
        films.hashCode ^
        species.hashCode ^
        starShips.hashCode ^
        vehicles.hashCode;
  }
}

class People extends ResponseList {
  List<PeopleItem> results;

  People(Map map)
      : results = _parseResults(map),
        super(map);

  static List<PeopleItem> _parseResults(Map map) {
    final list = <PeopleItem>[];
    print(map['results'].runtimeType);
    if (map.containsKey('results') && map['results'] is List) {
      for (var i = 0; i < map['results'].length; i++) {
        try {
          list.add(PeopleItem(map['results'][i]));
        } catch (err) {
          continue;
        }
      }
    }
    return list;
  }
}
