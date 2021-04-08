import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swtp/models/people.dart';

class Swapi {
  static const String _baseUrl = 'https://swapi.dev/api/';
  static const String _resourcePeople = 'people/';

  static Future<People> _searchSinglePeople(String name) async {
    final httpClient = http.Client();
    final urlRequest = Uri.parse(_baseUrl + _resourcePeople + '?search=$name');

    final response = await httpClient.get(urlRequest);
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200) {
      final map = json.decode(responseBody);
      return People(map);
    }
    throw Exception('code: ${response.statusCode}, message: $responseBody');
  }

  static Future<List<PeopleItem>> searchAllPeople(String name) async {
    final list = <PeopleItem>[];

    var people = await _searchSinglePeople(name);

    list.addAll(people.results);

    while (people.next != null) {
      people = await getPeople(
        url: people.next!.replaceAll('http:', 'https:'),
      );
      list.addAll(people.results);
    }

    list.sort((a, b) => a.name.compareTo(b.name));

    return list;
  }

  static Future<People> getPeople({int? page, String? url}) {
    final httpClient = http.Client();
    final urlRequest = Uri.parse(url ??
        _baseUrl +
            _resourcePeople +
            (page == null ? '' : page.toString() + '/'));
    return httpClient.get(urlRequest).then((response) {
      final responseBody = utf8.decode(response.bodyBytes);
      if (response.statusCode == 200) {
        var map = json.decode(responseBody);
        return People(map);
      }
      throw ('code: ${response.statusCode}, message: $responseBody');
    });
  }
}
