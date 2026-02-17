import '../../../../core/core.dart';
import '../../data/data.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductModel>> getProducts(Params params);
  Future<ProductModel> getProduct(Params id);
  Future<ProductModel> createProduct(Params params);
  Future<ProductModel> updateProduct(Params params);
}
