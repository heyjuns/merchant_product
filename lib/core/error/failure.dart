import 'error_exception.dart';

Failure mapExceptionToFailure(Exception exception) {
  if (exception is ConflictException) {
    return ConflictFailure(message: exception.message);
  }

  if (exception is ServerException) {
    return ServerFailure(message: exception.message, code: exception.code);
  }

  if (exception is NetworkException) {
    return NetworkFailure(message: exception.message);
  }

  if (exception is CacheException) {
    return CacheFailure(message: exception.message);
  }

  return ServerFailure(message: 'Unexpected error occurred');
}

abstract class Failure {
  final String message;
  final int? code;

  const Failure({required this.message, this.code});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.code});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message}) : super(code: -2);
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message}) : super(code: -3);
}

class ConflictFailure extends Failure {
  const ConflictFailure({required super.message}) : super(code: 409);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({required super.message}) : super(code: -1);
}

extension ErrorExceptionMapper on ErrorException {
  Failure toFailure() {
    return when(
      server: (message, code) => ServerFailure(message: message, code: code),

      network: (message) => NetworkFailure(message: message),

      cache: (message) => CacheFailure(message: message),

      conflict: (message) => ConflictFailure(message: message),

      timeout: (message) => TimeoutFailure(message: message),
    );
  }
}
