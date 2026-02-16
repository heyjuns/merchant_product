import 'package:fpdart/fpdart.dart';
import 'package:merchant_product/core/usecase.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class UpdateProductUsecase implements UseCase<Params, Unit> {
  final ProductRepository repository;

  UpdateProductUsecase(this.repository);

  @override
  BaseResponse<Unit> call(Params params) {
    return repository.updateProduct(params);
  }
}
