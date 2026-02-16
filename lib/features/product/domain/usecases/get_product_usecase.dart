import 'package:merchant_product/core/usecase.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class GetProductUsecase implements UseCase<Params, ProductEntity> {
  final ProductRepository repository;

  GetProductUsecase(this.repository);

  @override
  BaseResponse<ProductEntity> call(Params params) {
    return repository.getProduct(params);
  }
}
