import 'dart:convert';

import 'response_list.dart';
import 'swapi_item.dart';

class SpeciesItem extends SwapiItem {
  late final String name;
  late final String classification;
  late final String designation;
  late final String averageHeight;
  late final String averageLifespan;
  late final String eyeColors;
  late final String hairColors;
  late final String skinColors;
  late final String language;
  late final String? homeworldUrl;
  late final List<String> peopleUrls;
  late final List<String> filmUrls;
  late final String created;
  late final String edited;

  SpeciesItem({
    required String url,
    required this.name,
    required this.classification,
    required this.designation,
    required this.averageHeight,
    required this.averageLifespan,
    required this.eyeColors,
    required this.hairColors,
    required this.skinColors,
    required this.language,
    this.homeworldUrl,
    required this.peopleUrls,
    required this.filmUrls,
    required this.created,
    required this.edited,
  }) : super(url: url);

  SpeciesItem.fromMap(Map map) : super.fromMap(map) {
    if (map.containsKey('name') && map['name'] is String) {
      name = map['name'];
    } else {
      throw FormatException('name invalid or missing');
    }

    if (map.containsKey('classification') && map['classification'] is String) {
      classification = map['classification'];
    } else {
      throw FormatException('classification invalid or missing');
    }

    if (map.containsKey('designation') && map['designation'] is String) {
      designation = map['designation'];
    } else {
      throw FormatException('designation invalid or missing');
    }

    if (map.containsKey('average_height') && map['average_height'] is String) {
      averageHeight = map['average_height'];
    } else {
      throw FormatException('average_height invalid or missing');
    }

    if (map.containsKey('average_lifespan') &&
        map['average_lifespan'] is String) {
      averageLifespan = map['average_lifespan'];
    } else {
      throw FormatException('average_lifespan invalid or missing');
    }

    if (map.containsKey('eye_colors') && map['eye_colors'] is String) {
      eyeColors = map['eye_colors'];
    } else {
      throw FormatException('eye_colors invalid or missing');
    }

    if (map.containsKey('hair_colors') && map['hair_colors'] is String) {
      hairColors = map['hair_colors'];
    } else {
      throw FormatException('hair_colors invalid or missing');
    }

    if (map.containsKey('skin_colors') && map['skin_colors'] is String) {
      skinColors = map['skin_colors'];
    } else {
      throw FormatException('skin_colors invalid or missing');
    }

    if (map.containsKey('language') && map['language'] is String) {
      language = map['language'];
    } else {
      throw FormatException('language invalid or missing');
    }

    if (map.containsKey('homeworld') && map['homeworld'] is String) {
      homeworldUrl = map['homeworld'];
    } else {
      homeworldUrl = null;
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
    if (map.containsKey('films')) {
      for (var i = 0; i < map['films'].length; i++) {
        filmUrls.add(map['films'][i]);
      }
    }

    peopleUrls = <String>[];
    if (map.containsKey('people')) {
      for (var i = 0; i < map['people'].length; i++) {
        peopleUrls.add(map['people'][i]);
      }
    }
  }

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll({
        'name': name,
        'classification': classification,
        'designation': designation,
        'average_height': averageHeight,
        'average_lifespan': averageLifespan,
        'eye_colors': eyeColors,
        'hair_colors': hairColors,
        'skin_colors': skinColors,
        'language': language,
        'homeworld': homeworldUrl,
        'people': peopleUrls,
        'films': filmUrls,
        'created': created,
        'edited': edited,
      });
  }

  String toJson() => json.encode(toMap());

  factory SpeciesItem.fromJson(String source) =>
      SpeciesItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SpeciesItem(name: $name, classification: $classification, designation: $designation, averageHeight: $averageHeight, averageLifespan: $averageLifespan, eyeColors: $eyeColors, hairColors: $hairColors, skinColors: $skinColors, language: $language, homeworld: $homeworldUrl, people: $peopleUrls, films: $filmUrls, url: $url, created: $created, edited: $edited)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpeciesItem &&
        other.name == name &&
        other.classification == classification &&
        other.designation == designation &&
        other.averageHeight == averageHeight &&
        other.averageLifespan == averageLifespan &&
        other.eyeColors == eyeColors &&
        other.hairColors == hairColors &&
        other.skinColors == skinColors &&
        other.language == language &&
        other.homeworldUrl == homeworldUrl &&
        other.peopleUrls == peopleUrls &&
        other.filmUrls == filmUrls &&
        other.url == url &&
        other.created == created &&
        other.edited == edited;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        classification.hashCode ^
        designation.hashCode ^
        averageHeight.hashCode ^
        averageLifespan.hashCode ^
        eyeColors.hashCode ^
        hairColors.hashCode ^
        skinColors.hashCode ^
        language.hashCode ^
        homeworldUrl.hashCode ^
        peopleUrls.hashCode ^
        filmUrls.hashCode ^
        url.hashCode ^
        created.hashCode ^
        edited.hashCode;
  }
}

class Species extends ResponseList {
  final List<SpeciesItem> results;

  Species({
    required this.results,
    required int count,
    String? next,
    String? previous,
  }) : super(
          count: count,
          next: next,
          previous: previous,
        );

  Species.fromMap(Map map)
      : results = ResponseList.parseResults<SpeciesItem>(
          map,
          constructor: (map) => SpeciesItem.fromMap(map),
        ),
        super.fromMap(map);
}
