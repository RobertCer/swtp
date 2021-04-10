import 'dart:convert';

import 'package:hive/hive.dart';

import 'response_list.dart';

/// A Planet resource is a large mass, planet or planetoid in the Star Wars Universe, at the time of 0 ABY.
@HiveType(typeId: PlanetsItem.typeId)
class PlanetsItem {
  static const typeId = 1;
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String diameter;
  @HiveField(2)
  late String rotationPeriod;
  @HiveField(3)
  late String orbitalPeriod;
  @HiveField(4)
  late String gravity;
  @HiveField(5)
  late String population;
  @HiveField(6)
  late String climate;
  @HiveField(7)
  late String terrain;
  @HiveField(8)
  late String surfaceWater;
  @HiveField(9)
  late String url;
  @HiveField(10)
  late String created;
  @HiveField(11)
  late String edited;

  @HiveField(12)
  late List<String> residentUrls;
  @HiveField(13)
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

class PlanetsItemAdapter extends TypeAdapter<PlanetsItem> {
  @override
  final int typeId = 1;

  @override
  PlanetsItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final map = {
      'name': fields[0] as String,
      'diameter': fields[1] as String,
      'rotation_period': fields[2] as String,
      'orbital_period': fields[3] as String,
      'gravity': fields[4] as String,
      'population': fields[5] as String,
      'climate': fields[6] as String,
      'terrain': fields[7] as String,
      'surface_water': fields[8] as String,
      'url': fields[9] as String,
      'created': fields[10] as String,
      'edited': fields[11] as String,
      'residents': (fields[12] as List).cast<String>(),
      'films': (fields[13] as List).cast<String>(),
    };
    return PlanetsItem(map);
  }

  @override
  void write(BinaryWriter writer, PlanetsItem obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.diameter)
      ..writeByte(2)
      ..write(obj.rotationPeriod)
      ..writeByte(3)
      ..write(obj.orbitalPeriod)
      ..writeByte(4)
      ..write(obj.gravity)
      ..writeByte(5)
      ..write(obj.population)
      ..writeByte(6)
      ..write(obj.climate)
      ..writeByte(7)
      ..write(obj.terrain)
      ..writeByte(8)
      ..write(obj.surfaceWater)
      ..writeByte(9)
      ..write(obj.url)
      ..writeByte(10)
      ..write(obj.created)
      ..writeByte(11)
      ..write(obj.edited)
      ..writeByte(12)
      ..write(obj.residentUrls)
      ..writeByte(13)
      ..write(obj.filmUrls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlanetsItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
