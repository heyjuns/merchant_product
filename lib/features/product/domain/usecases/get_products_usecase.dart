import 'package:merchant_product/core/usecase.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class GetProductsUsecase implements UseCase<Params, List<ProductEntity>> {
  final ProductRepository repository;

  GetProductsUsecase(this.repository);

  @override
  BaseResponse<List<ProductEntity>> call(Params params) {
    return repository.getProducts(params);
  }
}
