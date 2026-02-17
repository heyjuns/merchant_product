import 'package:merchant_product/core/usecase.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class StreamProductsUsecase
    implements StreamUseCase<Params, List<ProductEntity>> {
  final ProductRepository repository;

  StreamProductsUsecase(this.repository);

  @override
  Stream<List<ProductEntity>> call(Params params) {
    return repository.streamProducts(params);
  }
}
