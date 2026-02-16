import 'package:fpdart/fpdart.dart';
import 'package:merchant_product/core/error/failure.dart';

import 'package:merchant_product/core/params.dart';

import 'package:merchant_product/core/typedefs.dart';

import '../../domain/domain.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remoteDatasource;

  ProductRepositoryImpl({required this.remoteDatasource});
  @override
  BaseResponse<Unit> createProduct(Params params) async {
    try {
      await remoteDatasource.createProduct(params);
      return right(unit);
    } on Exception catch (e) {
      return left(mapExceptionToFailure(e));
    }
  }

  @override
  BaseResponse<ProductEntity> getProduct(Params params) async {
    try {
      final model = await remoteDatasource.getProduct(params);

      print(
        'ProductRepositoryImpl.getProduct: Fetched product with ID ${model.id}',
      );
      return right(model.toEntity());
    } on Exception catch (e) {
      return left(mapExceptionToFailure(e));
    }
  }

  @override
  BaseResponse<List<ProductEntity>> getProducts(Params params) {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  BaseResponse<Unit> updateProduct(Params params) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
