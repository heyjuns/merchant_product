import 'package:merchant_product/core/typedefs.dart';

abstract class UseCase<P, T> {
  BaseResponse<T> call(P params);
}
