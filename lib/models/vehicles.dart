import 'dart:convert';

import 'package:hive/hive.dart';

import 'response_list.dart';

/// A Vehicle resource is a single transport craft that does not have hyperdrive capability.
class VehiclesItem {
  static const typeId = 5;
  late final String name;
  late final String model;
  late final String vehicleClass;
  late final String manufacturer;
  late final String length;
  late final String costInCredits;
  late final String crew;
  late final String passengers;
  late final String maxAtmospheringSpeed;
  late final String cargoCapacity;
  late final String consumables;
  late final List<String> films;
  late final List<String> pilots;
  late final String url;
  late final String created;
  late final String edited;

  VehiclesItem(Map map) {
    if (map.containsKey('name') && map['name'] is String) {
      name = map['name'];
    } else {
      throw FormatException('name invalid or missing');
    }

    if (map.containsKey('model') && map['model'] is String) {
      model = map['model'];
    } else {
      throw FormatException('model invalid or missing');
    }

    if (map.containsKey('vehicle_class') && map['vehicle_class'] is String) {
      vehicleClass = map['vehicle_class'];
    } else {
      throw FormatException('vehicle_class invalid or missing');
    }

    if (map.containsKey('manufacturer') && map['manufacturer'] is String) {
      manufacturer = map['manufacturer'];
    } else {
      throw FormatException('manufacturer invalid or missing');
    }

    if (map.containsKey('length') && map['length'] is String) {
      length = map['length'];
    } else {
      throw FormatException('length invalid or missing');
    }

    if (map.containsKey('cost_in_credits') &&
        map['cost_in_credits'] is String) {
      costInCredits = map['cost_in_credits'];
    } else {
      throw FormatException('cost_in_credits invalid or missing');
    }

    if (map.containsKey('crew') && map['crew'] is String) {
      crew = map['crew'];
    } else {
      throw FormatException('crew invalid or missing');
    }

    if (map.containsKey('passengers') && map['passengers'] is String) {
      passengers = map['passengers'];
    } else {
      throw FormatException('passengers invalid or missing');
    }

    if (map.containsKey('max_atmosphering_speed') &&
        map['max_atmosphering_speed'] is String) {
      maxAtmospheringSpeed = map['max_atmosphering_speed'];
    } else {
      throw FormatException('max_atmosphering_speed invalid or missing');
    }

    if (map.containsKey('cargo_capacity') && map['cargo_capacity'] is String) {
      cargoCapacity = map['cargo_capacity'];
    } else {
      throw FormatException('cargo_capacity invalid or missing');
    }

    if (map.containsKey('consumables') && map['consumables'] is String) {
      consumables = map['consumables'];
    } else {
      throw FormatException('consumables invalid or missing');
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

    films = <String>[];
    if (map.containsKey('films') && map['films'] is List) {
      for (var i = 0; i < map['films'].length; i++) {
        films.add(map['films'][i]);
      }
    }

    pilots = <String>[];
    if (map.containsKey('pilots') && map['pilots'] is List) {
      for (var i = 0; i < map['pilots'].length; i++) {
        pilots.add(map['pilots'][i]);
      }
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'model': model,
      'vehicle_class': vehicleClass,
      'manufacturer': manufacturer,
      'length': length,
      'cost_in_credits': costInCredits,
      'crew': crew,
      'passengers': passengers,
      'max_atmosphering_speed': maxAtmospheringSpeed,
      'cargo_capacity': cargoCapacity,
      'consumables': consumables,
      'films': films,
      'pilots': pilots,
      'url': url,
      'created': created,
      'edited': edited,
    };
  }

  String toJson() => json.encode(toMap());

  factory VehiclesItem.fromJson(String source) =>
      VehiclesItem(json.decode(source));

  @override
  String toString() {
    return 'VehiclesItem(name: $name, model: $model, vehicleClass: $vehicleClass, manufacturer: $manufacturer, length: $length, costInCredits: $costInCredits, crew: $crew, passengers: $passengers, maxAtmospheringSpeed: $maxAtmospheringSpeed, cargoCapacity: $cargoCapacity, consumables: $consumables, films: $films, pilots: $pilots, url: $url, created: $created, edited: $edited)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VehiclesItem &&
        other.name == name &&
        other.model == model &&
        other.vehicleClass == vehicleClass &&
        other.manufacturer == manufacturer &&
        other.length == length &&
        other.costInCredits == costInCredits &&
        other.crew == crew &&
        other.passengers == passengers &&
        other.maxAtmospheringSpeed == maxAtmospheringSpeed &&
        other.cargoCapacity == cargoCapacity &&
        other.consumables == consumables &&
        other.films == films &&
        other.pilots == pilots &&
        other.url == url &&
        other.created == created &&
        other.edited == edited;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        model.hashCode ^
        vehicleClass.hashCode ^
        manufacturer.hashCode ^
        length.hashCode ^
        costInCredits.hashCode ^
        crew.hashCode ^
        passengers.hashCode ^
        maxAtmospheringSpeed.hashCode ^
        cargoCapacity.hashCode ^
        consumables.hashCode ^
        films.hashCode ^
        pilots.hashCode ^
        url.hashCode ^
        created.hashCode ^
        edited.hashCode;
  }
}

/// Collection of VehiclesItem
class Vehicles extends ResponseList {
  List<VehiclesItem> results;

  Vehicles(Map map)
      : results = ResponseList.parseResults<VehiclesItem>(
          map,
          constructor: (map) => VehiclesItem(map),
        ),
        super(map);
}

class VehiclesItemAdapter extends TypeAdapter<VehiclesItem> {
  @override
  final int typeId = 5;

  @override
  VehiclesItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    final map = {
      'name': fields[0] as String,
      'model': fields[1] as String,
      'vehicle_class': fields[2] as String,
      'manufacturer': fields[3] as String,
      'length': fields[4] as String,
      'cost_in_credits': fields[5] as String,
      'crew': fields[6] as String,
      'passengers': fields[7] as String,
      'max_atmosphering_speed': fields[8] as String,
      'cargo_capacity': fields[9] as String,
      'consumables': fields[10] as String,
      'films': (fields[11] as List).cast<String>(),
      'pilots': (fields[12] as List).cast<String>(),
      'url': fields[13] as String,
      'created': fields[14] as String,
      'edited': fields[15] as String,
    };
    return VehiclesItem(map);
  }

  @override
  void write(BinaryWriter writer, VehiclesItem obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.model)
      ..writeByte(2)
      ..write(obj.vehicleClass)
      ..writeByte(3)
      ..write(obj.manufacturer)
      ..writeByte(4)
      ..write(obj.length)
      ..writeByte(5)
      ..write(obj.costInCredits)
      ..writeByte(6)
      ..write(obj.crew)
      ..writeByte(7)
      ..write(obj.passengers)
      ..writeByte(8)
      ..write(obj.maxAtmospheringSpeed)
      ..writeByte(9)
      ..write(obj.cargoCapacity)
      ..writeByte(10)
      ..write(obj.consumables)
      ..writeByte(11)
      ..write(obj.films)
      ..writeByte(12)
      ..write(obj.pilots)
      ..writeByte(13)
      ..write(obj.url)
      ..writeByte(14)
      ..write(obj.created)
      ..writeByte(15)
      ..write(obj.edited);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehiclesItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
