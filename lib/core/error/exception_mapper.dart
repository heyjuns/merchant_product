import 'error_exception.dart';
import 'failure.dart';

Failure mapExceptionToFailure(Exception e) {
  if (e is ErrorException) {
    return Failure(message: e.message, code: e.code);
  }

  return const Failure(message: 'Unexpected error occurred');
}
