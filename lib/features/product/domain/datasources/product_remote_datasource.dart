import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../../data/data.dart';

abstract class ProductRemoteDatasource {
  Future<PaginationProductModel> getProducts(Params params);
  Future<ProductModel> getProduct(Params id);
  Future<ProductModel> createProduct(Params params);
  Future<ProductModel> updateProduct(Params params);
  Future<Unit> syncProducts(Unit unit);
}
