import 'package:merchant_product/core/typedefs.dart';

abstract class UseCase<P, T> {
  BaseResponse<T> call(P params);
}

abstract class StreamUseCase<P, T> {
  Stream<T> call(P params);
}
