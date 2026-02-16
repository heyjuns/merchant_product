import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../../data/data.dart';

abstract class ProductRemoteDatasource {
  FutureResponse<List<ProductModel>> getProducts(Params params);
  FutureResponse<ProductModel> getProduct(Params id);
  FutureResponse<Unit> createProduct(Params params);
  FutureResponse<Unit> updateProduct(Params params);
}
