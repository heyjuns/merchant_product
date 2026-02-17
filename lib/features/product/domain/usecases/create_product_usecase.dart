import 'package:merchant_product/core/usecase.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class CreateProductUsecase implements UseCase<Params, int> {
  final ProductRepository repository;

  CreateProductUsecase(this.repository);

  @override
  BaseResponse<int> call(Params params) {
    return repository.createProduct(params);
  }
}
