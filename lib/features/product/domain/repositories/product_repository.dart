import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  BaseResponse<List<ProductEntity>> getProducts(Params params);
  BaseResponse<ProductEntity> getProduct(Params params);
  BaseResponse<int> createProduct(Params params);
  BaseResponse<int> updateProduct(Params params);
  BaseResponse<Unit> sync(Unit unit);
}
