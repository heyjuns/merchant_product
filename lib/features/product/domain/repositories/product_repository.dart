import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  BaseResponse<Unit> getProducts(Params params);
  Stream<List<ProductEntity>> streamProducts(Params params);
  BaseResponse<ProductEntity> getProduct(Params params);
  BaseResponse<Unit> createProduct(Params params);
  BaseResponse<Unit> updateProduct(Params params);
  BaseResponse<Unit> syncProducts(Unit unit);
}
