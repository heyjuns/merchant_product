import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../../data/data.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductModel>> getProducts(Params params);
  Future<ProductModel> getProduct(Params id);
  Future<Unit> createProduct(Params params);
  Future<Unit> updateProduct(Params params);
}
