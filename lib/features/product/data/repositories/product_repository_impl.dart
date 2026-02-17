import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remote;
  final ProductLocalDatasource local;

  ProductRepositoryImpl({required this.remote, required this.local});

  @override
  BaseResponse<ProductEntity> getProduct(Params params) async {
    try {
      final localId = int.parse(params.endPoint!);
      final model = await local.getProductById(localId);

      if (model == null) {
        return left(CacheFailure(message: 'Product not found'));
      }

      return right(model.toEntity());
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }

  @override
  BaseResponse<Unit> getProducts(Params params) async {
    try {
      final response = await remote.getProducts(params);

      final remoteList = response; // assume List<ProductDto>

      for (final dto in remoteList) {
        final model = dto.copyWith(synced: true);

        await local.addOrUpdateProduct(model);
      }

      return right(unit);
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }

  @override
  BaseResponse<Unit> createProduct(Params params) async {
    try {
      final dto = CreateProductDto.fromJson(params.body!);

      final model = ProductModel(
        localId: null,
        serverId: null,
        name: dto.name,
        price: dto.price,
        description: dto.description,
        status: dto.status,
        updatedAt: DateTime.now(),
        synced: false,
      );

      await local.addOrUpdateProduct(model);

      return right(unit);
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }

  @override
  BaseResponse<Unit> updateProduct(Params params) async {
    try {
      final dto = CreateProductDto.fromJson(params.body!);

      final existing = await local.getProductById(int.parse(params.endPoint!));

      if (existing == null) {
        return left(CacheFailure(message: 'Product not found'));
      }

      final updated = existing.copyWith(
        name: dto.name,
        price: dto.price,
        description: dto.description,
        status: dto.status,
        updatedAt: DateTime.now(),
        synced: false,
      );

      await local.addOrUpdateProduct(updated);

      return right(unit);
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }

  @override
  BaseResponse<Unit> syncProducts(Unit unit) async {
    try {
      final pending = await local.getPendingProducts();

      for (final product in pending) {
        if (product.serverId == null) {
          // CREATE REMOTE
          final response = await remote.createProduct(
            Params(body: product.toCreateProductDto().toJson()),
          );

          final synced = product.copyWith(
            serverId: response.serverId,
            synced: true,
          );

          await local.addOrUpdateProduct(synced);
        } else {
          // UPDATE REMOTE
          final response = await remote.updateProduct(
            Params(
              endPoint: product.serverId!.toString(),
              body: product.toCreateProductDto().toJson(),
            ),
          );

          final synced = product.copyWith(
            serverId: response.serverId,
            synced: true,
            updatedAt: response.updatedAt,
          );

          await local.addOrUpdateProduct(synced);
        }
      }

      return right(unit);
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }

  @override
  Stream<List<ProductEntity>> streamProducts(Params params) {
    return local
        .watchProducts(params)
        .map((models) => models.map((e) => e.toEntity()).toList());
  }
}
