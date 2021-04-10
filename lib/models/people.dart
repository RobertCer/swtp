import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:swtp/models/swapi_item.dart';

import 'response_list.dart';

/// A People resource is an individual person or character within the Star Wars universe.
class PeopleItem extends SwapiItem {
  static const typeId = 2;

  late final String name;
  late final String birthYear;
  late final String eyeColor;
  late final String gender;
  late final String hairColor;
  late final String height;
  late final String mass;
  late final String skinColor;
  late final String homeWorldUrl;
  late final String url;
  late final String created;
  late final String edited;
  late final List<String> filmUrls;
  late final List<String> specieUrls;
  late final List<String> starShipUrls;
  late final List<String> vehicleUrls;

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
      homeWorldUrl = map['homeworld'];
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
    if (map.containsKey('vehicles') && map['vehicles'] is String) {
      for (var i = 0; i < map['vehicles'].length; i++) {
        vehicleUrls.add(map['vehicles'][i]);
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
      'homeworld': homeWorldUrl,
      'url': url,
      'created': created,
      'edited': edited,
      'films': filmUrls,
      'species': specieUrls,
      'starships': starShipUrls,
      'vehicles': vehicleUrls,
    };
  }

  String toJson() => json.encode(toMap());

  factory PeopleItem.fromJson(String source) => PeopleItem(json.decode(source));

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
  List<PeopleItem> results;

  People(Map map)
      : results = ResponseList.parseResults<PeopleItem>(
          map,
          constructor: (map) => PeopleItem(map),
        ),
        super(map);
}

class PeopleItemAdapter extends TypeAdapter<PeopleItem> {
  @override
  final int typeId = 2;

  @override
  PeopleItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    final map = {
      'name': fields[0] as String,
      'birth_year': fields[1] as String,
      'eye_color': fields[2] as String,
      'gender': fields[3] as String,
      'hair_color': fields[4] as String,
      'height': fields[5] as String,
      'mass': fields[6] as String,
      'skin_color': fields[7] as String,
      'homeworld': fields[8] as String,
      'url': fields[9] as String,
      'created': fields[10] as String,
      'edited': fields[11] as String,
      'films': (fields[12] as List).cast<String>(),
      'species': (fields[13] as List).cast<String>(),
      'starships': (fields[14] as List).cast<String>(),
      'vehicles': (fields[15] as List).cast<String>(),
    };
    return PeopleItem(map);
  }

  @override
  void write(BinaryWriter writer, PeopleItem obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.birthYear)
      ..writeByte(2)
      ..write(obj.eyeColor)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.hairColor)
      ..writeByte(5)
      ..write(obj.height)
      ..writeByte(6)
      ..write(obj.mass)
      ..writeByte(7)
      ..write(obj.skinColor)
      ..writeByte(8)
      ..write(obj.homeWorldUrl)
      ..writeByte(9)
      ..write(obj.url)
      ..writeByte(10)
      ..write(obj.created)
      ..writeByte(11)
      ..write(obj.edited)
      ..writeByte(12)
      ..write(obj.filmUrls)
      ..writeByte(13)
      ..write(obj.specieUrls)
      ..writeByte(14)
      ..write(obj.starShipUrls)
      ..writeByte(15)
      ..write(obj.vehicleUrls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeopleItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
