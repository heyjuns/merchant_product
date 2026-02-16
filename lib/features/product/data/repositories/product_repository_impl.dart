import 'package:fpdart/fpdart.dart';
import '../../../../core/core.dart';
import '../../domain/domain.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remoteDatasource;

  ProductRepositoryImpl({required this.remoteDatasource});

  @override
  BaseResponse<ProductEntity> getProduct(Params params) async {
    try {
      final model = await remoteDatasource.getProduct(params);
      return right(model.toEntity());
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }

  @override
  BaseResponse<List<ProductEntity>> getProducts(Params params) async {
    try {
      final models = await remoteDatasource.getProducts(params);
      return right(models.map((model) => model.toEntity()).toList());
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }

  @override
  BaseResponse<Unit> createProduct(Params params) async {
    try {
      await remoteDatasource.createProduct(params);
      return right(unit);
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }

  @override
  BaseResponse<Unit> updateProduct(Params params) async {
    try {
      await remoteDatasource.updateProduct(params);
      return right(unit);
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }
}
