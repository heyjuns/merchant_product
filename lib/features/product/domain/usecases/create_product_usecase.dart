import 'package:fpdart/fpdart.dart';
import 'package:merchant_product/core/usecase.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class CreateProductUsecase implements UseCase<CreateProductDto, Unit> {
  final ProductRepository repository;

  CreateProductUsecase(this.repository);

  @override
  BaseResponse<Unit> call(CreateProductDto params) {
    return repository.createProduct(params);
  }
}
