class ErrorException implements Exception {
  final String message;
  final int? code;

  const ErrorException({required this.message, this.code});

  @override
  String toString() => 'ErrorException(message: $message, code: $code)';
}
