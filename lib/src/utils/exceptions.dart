/// ## FM Card Exception
/// ### **Type:** `Exception`
/// Custom exception class for FM credit card
class FMCardException implements Exception {
  FMCardException(this.message);
  String message;

  @override
  String toString() => message;
}
