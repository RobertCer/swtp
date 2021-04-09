import 'dart:convert';

import 'response_list.dart';

/// A Species resource is a type of person or character within the Star Wars Universe.
class SpeciesItem {
  late final String name;
  late final String classification;
  late final String designation;
  late final String averageHeight;
  late final String averageLifespan;
  late final String eyeColors;
  late final String hairColors;
  late final String skinColors;
  late final String language;
  late final String homeworld;
  late final List<String> people;
  late final List<String> films;
  late final String url;
  late final String created;
  late final String edited;

  SpeciesItem(Map map) {
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
      homeworld = map['homeworld'];
    } else {
      throw FormatException('homeworld invalid or missing');
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
    if (map.containsKey('films')) {
      for (var i = 0; i < map['films'].length; i++) {
        films.add(map['films'][i]);
      }
    }

    people = <String>[];
    if (map.containsKey('people')) {
      for (var i = 0; i < map['people'].length; i++) {
        people.add(map['people'][i]);
      }
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'classification': classification,
      'designation': designation,
      'averageHeight': averageHeight,
      'averageLifespan': averageLifespan,
      'eyeColors': eyeColors,
      'hairColors': hairColors,
      'skinColors': skinColors,
      'language': language,
      'homeworld': homeworld,
      'people': people,
      'films': films,
      'url': url,
      'created': created,
      'edited': edited,
    };
  }

  String toJson() => json.encode(toMap());

  factory SpeciesItem.fromJson(String source) =>
      SpeciesItem(json.decode(source));

  @override
  String toString() {
    return 'SpeciesItem(name: $name, classification: $classification, designation: $designation, averageHeight: $averageHeight, averageLifespan: $averageLifespan, eyeColors: $eyeColors, hairColors: $hairColors, skinColors: $skinColors, language: $language, homeworld: $homeworld, people: $people, films: $films, url: $url, created: $created, edited: $edited)';
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
        other.homeworld == homeworld &&
        other.people == people &&
        other.films == films &&
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
        homeworld.hashCode ^
        people.hashCode ^
        films.hashCode ^
        url.hashCode ^
        created.hashCode ^
        edited.hashCode;
  }
}

/// Collection of SpeciesItem
class Species extends ResponseList {
  List<SpeciesItem> results;

  Species(Map map)
      : results = _parseResults(map),
        super(map);

  static List<SpeciesItem> _parseResults(Map map) {
    final list = <SpeciesItem>[];
    print(map['results'].runtimeType);
    if (map.containsKey('results') && map['results'] is List) {
      for (var i = 0; i < map['results'].length; i++) {
        try {
          list.add(SpeciesItem(map['results'][i]));
        } catch (err) {
          continue;
        }
      }
    }
    return list;
  }
}
