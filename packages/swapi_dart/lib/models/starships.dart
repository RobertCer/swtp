import 'dart:convert';

import 'response_list.dart';
import 'swapi_item.dart';

class StarshipsItem extends SwapiItem {
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
  late final List<String> filmUrls;
  late final List<String> pilotUrls;
  late final String created;
  late final String edited;

  StarshipsItem({
    required String url,
    required this.name,
    required this.model,
    required this.starshipClass,
    required this.manufacturer,
    required this.costInCredits,
    required this.length,
    required this.crew,
    required this.passengers,
    required this.maxAtmospheringSpeed,
    required this.hyperdriveRating,
    required this.mglt,
    required this.cargoCapacity,
    required this.consumables,
    required this.filmUrls,
    required this.pilotUrls,
    required this.created,
    required this.edited,
  }) : super(url: url);

  StarshipsItem.fromMap(Map map) : super.fromMap(map) {
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

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll({
        'name': name,
        'model': model,
        'starship_class': starshipClass,
        'manufacturer': manufacturer,
        'cost_in_credits': costInCredits,
        'length': length,
        'crew': crew,
        'passengers': passengers,
        'max_atmosphering_speed': maxAtmospheringSpeed,
        'hyperdrive_rating': hyperdriveRating,
        'MGLT': mglt,
        'cargo_capacity': cargoCapacity,
        'consumables': consumables,
        'films': filmUrls,
        'pilots': pilotUrls,
        'created': created,
        'edited': edited,
      });
  }

  String toJson() => json.encode(toMap());

  factory StarshipsItem.fromJson(String source) =>
      StarshipsItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StarshipsItem(name: $name, model: $model, starshipClass: $starshipClass, manufacturer: $manufacturer, costInCredits: $costInCredits, length: $length, crew: $crew, passengers: $passengers, maxAtmospheringSpeed: $maxAtmospheringSpeed, hyperdriveRating: $hyperdriveRating, mglt: $mglt, cargoCapacity: $cargoCapacity, consumables: $consumables, films: $filmUrls, pilots: $pilotUrls, url: $url, created: $created, edited: $edited)';
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
        passengers.hashCode ^
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

class Starships extends ResponseList {
  final List<StarshipsItem> results;

  Starships({
    required this.results,
    required int count,
    String? next,
    String? previous,
  }) : super(
          count: count,
          next: next,
          previous: previous,
        );

  Starships.fromMap(Map map)
      : results = ResponseList.parseResults<StarshipsItem>(
          map,
          constructor: (map) => StarshipsItem.fromMap(map),
        ),
        super.fromMap(map);
}
