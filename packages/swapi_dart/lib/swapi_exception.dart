class SwapiException implements Exception {
  SwapiException({
    required this.message,
    required this.responseCode,
  });

  final String message;
  final int responseCode;

  @override
  String toString() => message;
}
