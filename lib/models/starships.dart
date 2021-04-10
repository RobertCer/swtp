import 'dart:convert';

import 'package:hive/hive.dart';

import 'response_list.dart';

/// A Starship resource is a single transport craft that has hyperdrive capability.
class StarshipsItem {
  static const typeId = 4;

  late final String name;
  late final String model;
  late final String starshipClass;
  late final String manufacturer;
  late final String costInCredits;
  late final String length;
  late final String crew;
  late final String passengerUrls;
  late final String maxAtmospheringSpeed;
  late final String hyperdriveRating;
  late final String mglt;
  late final String cargoCapacity;
  late final String consumables;
  late final List<String> filmUrls;
  late final List<String> pilotUrls;
  late final String url;
  late final String created;
  late final String edited;

  StarshipsItem(Map map) {
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

    if (map.containsKey('starship_class') && map['starship_class'] is String) {
      starshipClass = map['starship_class'];
    } else {
      throw FormatException('starship_class invalid or missing');
    }

    if (map.containsKey('manufacturer') && map['manufacturer'] is String) {
      manufacturer = map['manufacturer'];
    } else {
      throw FormatException('manufacturer invalid or missing');
    }

    if (map.containsKey('cost_in_credits') &&
        map['cost_in_credits'] is String) {
      costInCredits = map['cost_in_credits'];
    } else {
      throw FormatException('cost_in_credits invalid or missing');
    }

    if (map.containsKey('length') && map['length'] is String) {
      length = map['length'];
    } else {
      throw FormatException('length invalid or missing');
    }

    if (map.containsKey('crew') && map['crew'] is String) {
      crew = map['crew'];
    } else {
      throw FormatException('crew invalid or missing');
    }

    if (map.containsKey('passengers') && map['passengers'] is String) {
      passengerUrls = map['passengers'];
    } else {
      throw FormatException('passengers invalid or missing');
    }

    if (map.containsKey('max_atmosphering_speed') &&
        map['max_atmosphering_speed'] is String) {
      maxAtmospheringSpeed = map['max_atmosphering_speed'];
    } else {
      throw FormatException('max_atmosphering_speed invalid or missing');
    }

    if (map.containsKey('hyperdrive_rating') &&
        map['hyperdrive_rating'] is String) {
      hyperdriveRating = map['hyperdrive_rating'];
    } else {
      throw FormatException('hyperdrive_rating invalid or missing');
    }

    if (map.containsKey('MGLT') && map['MGLT'] is String) {
      mglt = map['MGLT'];
    } else {
      throw FormatException('MGLT invalid or missing');
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

    filmUrls = <String>[];
    if (map.containsKey('films') && map['films'] is List) {
      for (var i = 0; i < map['films'].length; i++) {
        filmUrls.add(map['films'][i]);
      }
    }

    pilotUrls = <String>[];
    if (map.containsKey('pilots') && map['pilots'] is List) {
      for (var i = 0; i < map['pilots'].length; i++) {
        pilotUrls.add(map['pilots'][i]);
      }
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'model': model,
      'starship_class': starshipClass,
      'manufacturer': manufacturer,
      'costInCredits': costInCredits,
      'length': length,
      'crew': crew,
      'passengers': passengerUrls,
      'max_atmosphering_speed': maxAtmospheringSpeed,
      'hyperdrive_rating': hyperdriveRating,
      'mglt': mglt,
      'cargo_capacity': cargoCapacity,
      'consumables': consumables,
      'films': filmUrls,
      'pilots': pilotUrls,
      'url': url,
      'created': created,
      'edited': edited,
    };
  }

  String toJson() => json.encode(toMap());

  factory StarshipsItem.fromJson(String source) =>
      StarshipsItem(json.decode(source));

  @override
  String toString() {
    return 'StarshipsItem(name: $name, model: $model, starshipClass: $starshipClass, manufacturer: $manufacturer, costInCredits: $costInCredits, length: $length, crew: $crew, passengers: $passengerUrls, maxAtmospheringSpeed: $maxAtmospheringSpeed, hyperdriveRating: $hyperdriveRating, mglt: $mglt, cargoCapacity: $cargoCapacity, consumables: $consumables, films: $filmUrls, pilots: $pilotUrls, url: $url, created: $created, edited: $edited)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StarshipsItem &&
        other.name == name &&
        other.model == model &&
        other.starshipClass == starshipClass &&
        other.manufacturer == manufacturer &&
        other.costInCredits == costInCredits &&
        other.length == length &&
        other.crew == crew &&
        other.passengerUrls == passengerUrls &&
        other.maxAtmospheringSpeed == maxAtmospheringSpeed &&
        other.hyperdriveRating == hyperdriveRating &&
        other.mglt == mglt &&
        other.cargoCapacity == cargoCapacity &&
        other.consumables == consumables &&
        other.filmUrls == filmUrls &&
        other.pilotUrls == pilotUrls &&
        other.url == url &&
        other.created == created &&
        other.edited == edited;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        model.hashCode ^
        starshipClass.hashCode ^
        manufacturer.hashCode ^
        costInCredits.hashCode ^
        length.hashCode ^
        crew.hashCode ^
        passengerUrls.hashCode ^
        maxAtmospheringSpeed.hashCode ^
        hyperdriveRating.hashCode ^
        mglt.hashCode ^
        cargoCapacity.hashCode ^
        consumables.hashCode ^
        filmUrls.hashCode ^
        pilotUrls.hashCode ^
        url.hashCode ^
        created.hashCode ^
        edited.hashCode;
  }
}

/// Collection of StarshipsItem
class Starships extends ResponseList {
  List<StarshipsItem> results;

  Starships(Map map)
      : results = ResponseList.parseResults<StarshipsItem>(
          map,
          constructor: (map) => StarshipsItem(map),
        ),
        super(map);
}

class StarshipsItemAdapter extends TypeAdapter<StarshipsItem> {
  @override
  final int typeId = 4;

  @override
  StarshipsItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    final map = {
      'name': fields[0] as String,
      'model': fields[1] as String,
      'starship_class': fields[2] as String,
      'manufacturer': fields[3] as String,
      'costInCredits': fields[4] as String,
      'length': fields[5] as String,
      'crew': fields[6] as String,
      'passengers': fields[7] as String,
      'max_atmosphering_speed': fields[8] as String,
      'hyperdrive_rating': fields[9] as String,
      'mglt': fields[10] as String,
      'cargo_capacity': fields[11] as String,
      'consumables': fields[12] as String,
      'films': (fields[13] as List).cast<String>(),
      'pilots': (fields[14] as List).cast<String>(),
      'url': fields[15] as String,
      'created': fields[16] as String,
      'edited': fields[17] as String,
    };
    return StarshipsItem(map);
  }

  @override
  void write(BinaryWriter writer, StarshipsItem obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.model)
      ..writeByte(2)
      ..write(obj.starshipClass)
      ..writeByte(3)
      ..write(obj.manufacturer)
      ..writeByte(4)
      ..write(obj.costInCredits)
      ..writeByte(5)
      ..write(obj.length)
      ..writeByte(6)
      ..write(obj.crew)
      ..writeByte(7)
      ..write(obj.passengerUrls)
      ..writeByte(8)
      ..write(obj.maxAtmospheringSpeed)
      ..writeByte(9)
      ..write(obj.hyperdriveRating)
      ..writeByte(10)
      ..write(obj.mglt)
      ..writeByte(11)
      ..write(obj.cargoCapacity)
      ..writeByte(12)
      ..write(obj.consumables)
      ..writeByte(13)
      ..write(obj.filmUrls)
      ..writeByte(14)
      ..write(obj.pilotUrls)
      ..writeByte(15)
      ..write(obj.url)
      ..writeByte(16)
      ..write(obj.created)
      ..writeByte(17)
      ..write(obj.edited);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StarshipsItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
