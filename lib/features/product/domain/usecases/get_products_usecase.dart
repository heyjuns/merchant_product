import 'package:merchant_product/core/usecase.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class GetProductsUsecase implements UseCase<Params, int> {
  final ProductRepository repository;

  GetProductsUsecase(this.repository);

  @override
  BaseResponse<int> call(Params params) {
    return repository.getProducts(params);
  }
}
