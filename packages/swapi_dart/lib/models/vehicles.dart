import 'dart:convert';

import 'response_list.dart';
import 'swapi_item.dart';

class VehiclesItem extends SwapiItem {
  late String name;
  late String model;
  late String vehicleClass;
  late String manufacturer;
  late String length;
  late String costInCredits;
  late String crew;
  late String passengers;
  late String maxAtmospheringSpeed;
  late String cargoCapacity;
  late String consumables;
  late List<String> filmUrls;
  late List<String> pilotUrls;
  late String created;
  late String edited;

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
      'vehicle_class': vehicleClass,
      'manufacturer': manufacturer,
      'length': length,
      'cost_in_credits': costInCredits,
      'crew': crew,
      'passengers': passengers,
      'max_atmosphering_speed': maxAtmospheringSpeed,
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

  factory VehiclesItem.fromJson(String source) =>
      VehiclesItem(json.decode(source));

  @override
  String toString() {
    return 'VehiclesItem(name: $name, model: $model, vehicleClass: $vehicleClass, manufacturer: $manufacturer, length: $length, costInCredits: $costInCredits, crew: $crew, passengers: $passengers, maxAtmospheringSpeed: $maxAtmospheringSpeed, cargoCapacity: $cargoCapacity, consumables: $consumables, films: $filmUrls, pilots: $pilotUrls, url: $url, created: $created, edited: $edited)';
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
        vehicleClass.hashCode ^
        manufacturer.hashCode ^
        length.hashCode ^
        costInCredits.hashCode ^
        crew.hashCode ^
        passengers.hashCode ^
        maxAtmospheringSpeed.hashCode ^
        cargoCapacity.hashCode ^
        consumables.hashCode ^
        filmUrls.hashCode ^
        pilotUrls.hashCode ^
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
