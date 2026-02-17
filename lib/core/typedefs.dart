import 'package:fpdart/fpdart.dart';

import 'error/failure.dart';

typedef BaseResponse<T> = Future<Either<Failure, T>>;
