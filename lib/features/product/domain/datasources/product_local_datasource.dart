import 'package:fpdart/fpdart.dart';
import 'package:merchant_product/core/params.dart';

import '../../product.dart';

abstract class ProductLocalDatasource {
  Stream<List<ProductModel>> watchProducts(Params params);
  Future<ProductModel?> getProductById(int id);
  Future<ProductModel?> getProductByServerId(int id);
  Future<Unit> addOrUpdateProduct(ProductModel product);
  Future<List<ProductModel>> getPendingProducts();
}
