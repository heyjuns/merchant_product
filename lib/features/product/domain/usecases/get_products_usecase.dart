import 'package:fpdart/fpdart.dart';
import 'package:merchant_product/core/usecase.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class GetProductsUsecase implements UseCase<Params, Unit> {
  final ProductRepository repository;

  GetProductsUsecase(this.repository);

  @override
  BaseResponse<Unit> call(Params params) {
    return repository.getProducts(params);
  }
}
