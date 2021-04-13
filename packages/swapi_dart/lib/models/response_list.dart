import 'package:meta/meta.dart';

class ResponseList {
  late final int count;
  late final String? next;
  late final String? previous;

  ResponseList({
    required this.count,
    this.next,
    this.previous,
  });

  ResponseList.fromMap(Map map) {
    if (map.containsKey('count') && map['count'] is int) {
      count = map['count'];
    } else {
      throw FormatException('invalid count');
    }

    if (map.containsKey('next') && map['next'] is String) {
      next = map['next'];
    } else {
      next = null;
    }

    if (map.containsKey('previous') && map['previous'] is String) {
      previous = map['previous'];
    } else {
      previous = null;
    }
  }

  @protected
  static List<T> parseResults<T>(
    Map map, {
    required T Function(Map) constructor,
  }) {
    final list = <T>[];
    if (map.containsKey('results') && map['results'] is List) {
      final results = map['results'];
      for (var i = 0, n = results.length; i < n; i++) {
        list.add(constructor(results[i]));
      }
    }
    return list;
  }
}
