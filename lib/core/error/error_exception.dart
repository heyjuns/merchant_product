import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_exception.freezed.dart';

@freezed
abstract class ErrorException with _$ErrorException implements Exception {
  const factory ErrorException.server({required String message, int? code}) =
      ServerException;

  const factory ErrorException.timeout({required String message}) =
      TimeoutException;

  const factory ErrorException.network({required String message}) =
      NetworkException;

  const factory ErrorException.cache({required String message}) =
      CacheException;

  const factory ErrorException.conflict({required String message}) =
      ConflictException;
}

class RemoteExceptionMapper {
  static ErrorException map(Object error) {
    if (error is DioException) {
      return _mapDio(error);
    }

    if (error is SocketException) {
      return const ErrorException.network(message: 'No internet connection');
    }

    return const ErrorException.server(message: 'Unexpected error occurred');
  }

  static ErrorException _mapDio(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return const ErrorException.timeout(message: 'Request timeout');
    }

    if (e.type == DioExceptionType.connectionError) {
      return const ErrorException.network(message: 'No internet connection');
    }

    final statusCode = e.response?.statusCode ?? 0;

    if (statusCode == 409) {
      return ErrorException.conflict(
        message: e.response?.data?['message'] ?? 'Conflict occurred',
      );
    }

    return ErrorException.server(
      message: e.response?.data?['message'] ?? 'Server error',
      code: statusCode,
    );
  }
}
