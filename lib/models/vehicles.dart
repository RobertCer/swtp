import 'dart:convert';

import 'response_list.dart';

/// A Vehicle resource is a single transport craft that does not have hyperdrive capability.
class VehiclesItem {
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
      'vehicleClass': vehicleClass,
      'manufacturer': manufacturer,
      'length': length,
      'costInCredits': costInCredits,
      'crew': crew,
      'passengers': passengers,
      'maxAtmospheringSpeed': maxAtmospheringSpeed,
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
      : results = _parseResults(map),
        super(map);

  static List<VehiclesItem> _parseResults(Map map) {
    final list = <VehiclesItem>[];
    print(map['results'].runtimeType);
    if (map.containsKey('results') && map['results'] is List) {
      for (var i = 0; i < map['results'].length; i++) {
        try {
          list.add(VehiclesItem(map['results'][i]));
        } catch (err) {
          continue;
        }
      }
    }
    return list;
  }
}
