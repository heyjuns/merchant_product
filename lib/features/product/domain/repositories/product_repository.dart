import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../domain.dart';

abstract class ProductRepository {
  BaseResponse<int> getProducts(ProductsDto params);
  Stream<List<ProductEntity>> streamProducts();
  BaseResponse<ProductEntity> getProduct(int id);
  BaseResponse<Unit> createProduct(CreateProductDto params);
  BaseResponse<Unit> updateProduct(CreateProductDto params);
  BaseResponse<Unit> syncProducts(Unit unit);
}
