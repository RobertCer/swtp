import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'response_list.dart';
import 'swapi_item.dart';

class PeopleItem extends SwapiItem {
  late final String name;
  late final String birthYear;
  late final String eyeColor;
  late final String gender;
  late final String hairColor;
  late final String height;
  late final String mass;
  late final String skinColor;
  late final String homeWorldUrl;
  late final String created;
  late final String edited;
  late final List<String> filmUrls;
  late final List<String> specieUrls;
  late final List<String> starShipUrls;
  late final List<String> vehicleUrls;

  PeopleItem({
    required String url,
    required this.name,
    required this.birthYear,
    required this.eyeColor,
    required this.gender,
    required this.hairColor,
    required this.height,
    required this.mass,
    required this.skinColor,
    required this.homeWorldUrl,
    required this.created,
    required this.edited,
    required this.filmUrls,
    required this.specieUrls,
    required this.starShipUrls,
    required this.vehicleUrls,
  }) : super(url: url);

  PeopleItem.fromMap(Map map) : super.fromMap(map) {
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
      homeWorldUrl = map['homeworld'];
    } else {
      throw FormatException('invalid homeworld');
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

    filmUrls = <String>[];
    if (map.containsKey('films') && map['films'] is List) {
      for (var i = 0; i < map['films'].length; i++) {
        filmUrls.add(map['films'][i]);
      }
    }

    specieUrls = <String>[];
    if (map.containsKey('species') && map['species'] is List) {
      for (var i = 0; i < map['species'].length; i++) {
        specieUrls.add(map['species'][i]);
      }
    }

    starShipUrls = <String>[];
    if (map.containsKey('starships') && map['starships'] is List) {
      for (var i = 0; i < map['starships'].length; i++) {
        starShipUrls.add(map['starships'][i]);
      }
    }

    vehicleUrls = <String>[];
    if (map.containsKey('vehicles') && map['vehicles'] is List) {
      for (var i = 0; i < map['vehicles'].length; i++) {
        vehicleUrls.add(map['vehicles'][i]);
      }
    }
  }

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll({
        'name': name,
        'birth_year': birthYear,
        'eye_color': eyeColor,
        'gender': gender,
        'hair_color': hairColor,
        'height': height,
        'mass': mass,
        'skin_color': skinColor,
        'homeworld': homeWorldUrl,
        'created': created,
        'edited': edited,
        'films': filmUrls,
        'species': specieUrls,
        'starships': starShipUrls,
        'vehicles': vehicleUrls,
      });
  }

  String toJson() => json.encode(toMap());

  factory PeopleItem.fromJson(String source) =>
      PeopleItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PeopleItem(name: $name, birthYear: $birthYear, eyeColor: $eyeColor, gender: $gender, hairColor: $hairColor, height: $height, mass: $mass, skinColor: $skinColor, homeworld: $homeWorldUrl, url: $url, created: $created, edited: $edited, films: $filmUrls, species: $specieUrls, starships: $starShipUrls, vehicles: $vehicleUrls)';
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
        other.homeWorldUrl == homeWorldUrl &&
        other.url == url &&
        other.created == created &&
        other.edited == edited &&
        listEquals(other.filmUrls, filmUrls) &&
        listEquals(other.specieUrls, specieUrls) &&
        listEquals(other.starShipUrls, starShipUrls) &&
        listEquals(other.vehicleUrls, vehicleUrls);
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
        homeWorldUrl.hashCode ^
        url.hashCode ^
        created.hashCode ^
        edited.hashCode ^
        filmUrls.hashCode ^
        specieUrls.hashCode ^
        starShipUrls.hashCode ^
        vehicleUrls.hashCode;
  }
}

class People extends ResponseList {
  final List<PeopleItem> results;

  People({
    required this.results,
    required int count,
    String? next,
    String? previous,
  }) : super(
          count: count,
          next: next,
          previous: previous,
        );

  People.fromMap(Map map)
      : results = ResponseList.parseResults<PeopleItem>(
          map,
          constructor: (map) => PeopleItem.fromMap(map),
        ),
        super.fromMap(map);
}
