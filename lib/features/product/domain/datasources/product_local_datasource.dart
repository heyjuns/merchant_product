import 'package:fpdart/fpdart.dart';

import '../../product.dart';

abstract class ProductLocalDatasource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel?> getProductById(int id);
  Future<Unit> addOrUpdateProduct(ProductModel product, {bool synced});
  Future<List<ProductModel>> getPendingProducts();
}
