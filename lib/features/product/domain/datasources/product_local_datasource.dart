import 'package:fpdart/fpdart.dart';

import '../../product.dart';

abstract class ProductLocalDatasource {
  Stream<List<ProductModel>> watchProducts();
  Future<ProductModel?> getProductById(int id);
  Future<ProductModel?> getProductByServerId(int id);
  Future<Unit> addOrUpdateProduct(ProductModel product);
  Future<List<ProductModel>> getPendingProducts();
}
