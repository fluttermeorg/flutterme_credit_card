class FluttermeCardException implements Exception {
  FluttermeCardException(this.message);
  String message;

  @override
  String toString() => message;
}
