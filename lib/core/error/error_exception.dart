/// Base exception for all custom exceptions
abstract class ErrorException implements Exception {
  final String message;
  final int? code;

  const ErrorException({required this.message, this.code});

  @override
  String toString() => 'ErrorException(message: $message, code: $code)';
}

/// Thrown when server returns non-2xx
class ServerException extends ErrorException {
  const ServerException({required super.message, super.code});
}

/// Thrown when request times out
class TimeoutException extends ErrorException {
  const TimeoutException({required super.message}) : super(code: -1);
}

/// Thrown when device has no connection
class NetworkException extends ErrorException {
  const NetworkException({required super.message}) : super(code: -2);
}

/// Thrown when local storage fails
class CacheException extends ErrorException {
  const CacheException({required super.message}) : super(code: -3);
}

/// Thrown when backend returns HTTP 409
class ConflictException extends ErrorException {
  const ConflictException({required super.message}) : super(code: 409);
}
