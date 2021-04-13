import 'dart:convert';

import 'package:hive/hive.dart';

abstract class SwapiItem {
  @HiveField(0)
  late final String url;

  SwapiItem({
    required this.url,
  });

  SwapiItem.fromMap(Map map) {
    if (map.containsKey('url') && map['url'] is String) {
      url = map['url'];
    } else {
      throw FormatException('url invalid or missing');
    }
  }

  @override
  String toString() => 'SwapiItem(url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SwapiItem && other.url == url;
  }

  @override
  int get hashCode => url.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }
}
