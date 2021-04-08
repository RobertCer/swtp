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
}
