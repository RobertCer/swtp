import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'response_list.dart';

/// A Starship resource is a single transport craft that has hyperdrive capability.
class StarshipsItem {
  late final String name;
  late final String model;
  late final String starshipClass;
  late final String manufacturer;
  late final String costInCredits;
  late final String length;
  late final String crew;
  late final String passengers;
  late final String maxAtmospheringSpeed;
  late final String hyperdriveRating;
  late final String mglt;
  late final String cargoCapacity;
  late final String consumables;
  late final List<String> films;
  late final List<String> pilots;
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
      'starshipClass': starshipClass,
      'manufacturer': manufacturer,
      'costInCredits': costInCredits,
      'length': length,
      'crew': crew,
      'passengers': passengers,
      'maxAtmospheringSpeed': maxAtmospheringSpeed,
      'hyperdriveRating': hyperdriveRating,
      'mglt': mglt,
      'cargoCapacity': cargoCapacity,
      'consumables': consumables,
      'films': films,
      'pilots': pilots,
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
    return 'StarshipsItem(name: $name, model: $model, starshipClass: $starshipClass, manufacturer: $manufacturer, costInCredits: $costInCredits, length: $length, crew: $crew, passengers: $passengers, maxAtmospheringSpeed: $maxAtmospheringSpeed, hyperdriveRating: $hyperdriveRating, mglt: $mglt, cargoCapacity: $cargoCapacity, consumables: $consumables, films: $films, pilots: $pilots, url: $url, created: $created, edited: $edited)';
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
        other.passengers == passengers &&
        other.maxAtmospheringSpeed == maxAtmospheringSpeed &&
        other.hyperdriveRating == hyperdriveRating &&
        other.mglt == mglt &&
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
        starshipClass.hashCode ^
        manufacturer.hashCode ^
        costInCredits.hashCode ^
        length.hashCode ^
        crew.hashCode ^
        passengers.hashCode ^
        maxAtmospheringSpeed.hashCode ^
        hyperdriveRating.hashCode ^
        mglt.hashCode ^
        cargoCapacity.hashCode ^
        consumables.hashCode ^
        films.hashCode ^
        pilots.hashCode ^
        url.hashCode ^
        created.hashCode ^
        edited.hashCode;
  }
}

/// Collection of StarshipsItem
class Starships extends ResponseList {
  List<StarshipsItem> results;

  Starships(Map map)
      : results = _parseResults(map),
        super(map);

  static List<StarshipsItem> _parseResults(Map map) {
    final list = <StarshipsItem>[];
    print(map['results'].runtimeType);
    if (map.containsKey('results') && map['results'] is List) {
      for (var i = 0; i < map['results'].length; i++) {
        try {
          list.add(StarshipsItem(map['results'][i]));
        } catch (err) {
          continue;
        }
      }
    }
    return list;
  }
}
