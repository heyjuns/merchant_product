import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remote;
  final ProductLocalDatasource local;

  ProductRepositoryImpl({required this.remote, required this.local});

  @override
  BaseResponse<ProductEntity> getProduct(int id) async {
    try {
      final model = await local.getProductById(id);

      if (model == null) {
        return left(CacheFailure(message: 'Product not found'));
      }

      return right(model.toEntity());
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }

  @override
  BaseResponse<int> getProducts(ProductsDto params) async {
    try {
      final response = await remote.getProducts(
        Params(queryParameters: params.toJson()),
      );

      for (final product in response.products) {
        if (product.serverId == null) continue;
        final exist = await local.getProductByServerId(product.serverId!);

        final model = product.copyWith(localId: exist?.localId, synced: true);
        await local.addOrUpdateProduct(model);
      }

      return right(response.total);
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }

  @override
  Stream<List<ProductEntity>> streamProducts() {
    return local.watchProducts().map(
      (models) => models.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  BaseResponse<Unit> createProduct(CreateProductDto dto) async {
    try {
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
  BaseResponse<Unit> updateProduct(CreateProductDto dto) async {
    try {
      final existing = await local.getProductById(dto.id!);

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
        try {
          if (product.serverId == null) {
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
        } catch (_) {}
      }

      return right(unit);
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }
}
