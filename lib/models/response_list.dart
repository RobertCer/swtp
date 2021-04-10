import 'package:meta/meta.dart';

class ResponseList {
  late final int count;
  String? next;
  String? previous;

  ResponseList(Map map) {
    if (map.containsKey('count') && map['count'] is int) {
      count = map['count'];
    } else {
      throw FormatException('invalid count');
    }

    if (map.containsKey('next') && map['next'] is String) {
      next = map['next'];
    }

    if (map.containsKey('previous') && map['previous'] is String) {
      previous = map['previous'];
    }
  }

  @protected
  static List<T> parseResults<T>(
    Map map, {
    required T Function(Map) constructor,
  }) {
    final list = <T>[];
    print(map['results'].runtimeType);
    if (map.containsKey('results') && map['results'] is List) {
      for (var i = 0; i < map['results'].length; i++) {
        try {
          list.add(constructor(map['results'][i]));
        } catch (err) {
          continue;
        }
      }
    }
    return list;
  }
}
