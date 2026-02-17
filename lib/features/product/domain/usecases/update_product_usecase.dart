import 'package:merchant_product/core/usecase.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class UpdateProductUsecase implements UseCase<Params, int> {
  final ProductRepository repository;

  UpdateProductUsecase(this.repository);

  @override
  BaseResponse<int> call(Params params) {
    return repository.updateProduct(params);
  }
}
