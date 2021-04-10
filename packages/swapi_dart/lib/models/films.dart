import 'dart:convert';

import 'response_list.dart';
import 'swapi_item.dart';

/// A Film resource is a single film.
class FilmsItem extends SwapiItem {
  late String title;
  late int episodeId;
  late String openingCrawl;
  late String director;
  late String producer;
  late String releaseDate;
  late List<String> specieUrls;
  late List<String> starshipUrls;
  late List<String> vehicleUrls;
  late List<String> characterUrls;
  late List<String> planetUrls;
  late String created;
  late String edited;

  FilmsItem(Map map) {
    if (map.containsKey('title') && map['title'] is String) {
      title = map['title'];
    } else {
      throw FormatException('title invalid or missing');
    }

    if (map.containsKey('episode_id') && map['episode_id'] is int) {
      episodeId = map['episode_id'];
    } else {
      throw FormatException('episode_id invalid or missing');
    }

    if (map.containsKey('opening_crawl') && map['opening_crawl'] is String) {
      openingCrawl = map['opening_crawl'];
    } else {
      throw FormatException('opening_crawl invalid or missing');
    }

    if (map.containsKey('director') && map['director'] is String) {
      director = map['director'];
    } else {
      throw FormatException('director invalid or missing');
    }

    if (map.containsKey('producer') && map['producer'] is String) {
      producer = map['producer'];
    } else {
      throw FormatException('producer invalid or missing');
    }

    if (map.containsKey('release_date') && map['release_date'] is String) {
      releaseDate = map['release_date'];
    } else {
      throw FormatException('release_date invalid or missing');
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

    specieUrls = <String>[];
    if (map.containsKey('species') && map['species'] is List) {
      for (var i = 0; i < map['species'].length; i++) {
        specieUrls.add(map['species'][i]);
      }
    }

    starshipUrls = <String>[];
    if (map.containsKey('starships') && map['starships'] is List) {
      for (var i = 0; i < map['starships'].length; i++) {
        starshipUrls.add(map['starships'][i]);
      }
    }

    vehicleUrls = <String>[];
    if (map.containsKey('vehicles') && map['vehicles'] is List) {
      for (var i = 0; i < map['vehicles'].length; i++) {
        vehicleUrls.add(map['vehicles'][i]);
      }
    }

    characterUrls = <String>[];
    if (map.containsKey('characters') && map['characters'] is List) {
      for (var i = 0; i < map['characters'].length; i++) {
        characterUrls.add(map['characters'][i]);
      }
    }

    planetUrls = <String>[];
    if (map.containsKey('planets') && map['planets'] is List) {
      for (var i = 0; i < map['planets'].length; i++) {
        planetUrls.add(map['planets'][i]);
      }
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'episode_id': episodeId,
      'opening_crawl': openingCrawl,
      'director': director,
      'producer': producer,
      'releaseDate': releaseDate,
      'species': specieUrls,
      'starships': starshipUrls,
      'vehicles': vehicleUrls,
      'characters': characterUrls,
      'planets': planetUrls,
      'url': url,
      'created': created,
      'edited': edited,
    };
  }

  String toJson() => json.encode(toMap());

  factory FilmsItem.fromJson(String source) => FilmsItem(json.decode(source));

  @override
  String toString() {
    return 'FilmsItem(title: $title, episodeId: $episodeId, openingCrawl: $openingCrawl, director: $director, producer: $producer, releaseDate: $releaseDate, species: $specieUrls, starships: $starshipUrls, vehicles: $vehicleUrls, characters: $characterUrls, planets: $planetUrls, url: $url, created: $created, edited: $edited)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FilmsItem &&
        other.title == title &&
        other.episodeId == episodeId &&
        other.openingCrawl == openingCrawl &&
        other.director == director &&
        other.producer == producer &&
        other.releaseDate == releaseDate &&
        other.specieUrls == specieUrls &&
        other.starshipUrls == starshipUrls &&
        other.vehicleUrls == vehicleUrls &&
        other.characterUrls == characterUrls &&
        other.planetUrls == planetUrls &&
        other.url == url &&
        other.created == created &&
        other.edited == edited;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        episodeId.hashCode ^
        openingCrawl.hashCode ^
        director.hashCode ^
        producer.hashCode ^
        releaseDate.hashCode ^
        specieUrls.hashCode ^
        starshipUrls.hashCode ^
        vehicleUrls.hashCode ^
        characterUrls.hashCode ^
        planetUrls.hashCode ^
        url.hashCode ^
        created.hashCode ^
        edited.hashCode;
  }
}

/// Collection of FilmsItem
class Films extends ResponseList {
  List<FilmsItem> results;

  Films(Map map)
      : results = _parseResults(map),
        super(map);

  static List<FilmsItem> _parseResults(Map map) {
    final list = <FilmsItem>[];
    print(map['results'].runtimeType);
    if (map.containsKey('results') && map['results'] is List) {
      for (var i = 0; i < map['results'].length; i++) {
        try {
          list.add(FilmsItem(map['results'][i]));
        } catch (err) {
          continue;
        }
      }
    }
    return list;
  }
}
