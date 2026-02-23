import 'package:fpdart/fpdart.dart';
import 'package:merchant_product/core/usecase.dart';

import '../domain.dart';

class StreamProductsUsecase
    implements StreamUseCase<Unit, List<ProductEntity>> {
  final ProductRepository repository;

  StreamProductsUsecase(this.repository);

  @override
  Stream<List<ProductEntity>> call(Unit params) {
    return repository.streamProducts();
  }
}
