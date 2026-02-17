import 'package:fpdart/fpdart.dart';
import 'package:merchant_product/core/usecase.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class SyncProductsUsecase implements UseCase<Unit, Unit> {
  final ProductRepository repository;

  SyncProductsUsecase(this.repository);

  @override
  BaseResponse<Unit> call(Unit params) {
    return repository.syncProducts(params);
  }
}
