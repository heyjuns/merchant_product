import 'package:fpdart/fpdart.dart';
import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remoteDatasource;
  final ProductLocalDatasource localDatasource;

  ProductRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  // --- Get single product ---
  @override
  BaseResponse<ProductEntity> getProduct(Params params) async {
    try {
      // 1️⃣ Try fetching from local first
      final id = int.parse(params.endPoint!);
      final localModel = await localDatasource.getProductById(id);

      if (localModel != null) {
        // Return local data instantly
        return right(localModel.toEntity());
      }

      // 2️⃣ Fallback to remote if local empty
      final remoteModel = await remoteDatasource.getProduct(params);

      // 3️⃣ Save remote product locally for offline use
      await localDatasource.addOrUpdateProduct(remoteModel, synced: true);

      return right(remoteModel.toEntity());
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }

  // --- Get list of products ---
  @override
  BaseResponse<List<ProductEntity>> getProducts(Params params) async {
    try {
      // 1️⃣ Try local first
      final localModels = await localDatasource.getProducts();
      if (localModels.isNotEmpty) {
        return right(localModels.map((m) => m.toEntity()).toList());
      }

      // 2️⃣ Fetch from remote if local empty
      final remoteModels = await remoteDatasource.getProducts(params);

      // 3️⃣ Cache remote products locally
      for (var product in remoteModels) {
        await localDatasource.addOrUpdateProduct(product, synced: true);
      }

      return right(remoteModels.map((m) => m.toEntity()).toList());
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }

  // --- Create product (offline-first) ---
  @override
  BaseResponse<int> createProduct(Params params) async {
    try {
      // Convert params.body → ProductModel
      final model = ProductModel.fromJson(params.body!);

      // 1️⃣ Save locally first
      await localDatasource.addOrUpdateProduct(model, synced: false);

      // 2️⃣ Return immediately, sync to remote later
      return right(model.id);
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }

  // --- Update product (offline-first) ---
  @override
  BaseResponse<int> updateProduct(Params params) async {
    try {
      final model = ProductModel.fromJson(params.body!);

      // 1️⃣ Update locally first
      await localDatasource.addOrUpdateProduct(model, synced: false);

      // 2️⃣ Return immediately, sync to remote later
      return right(model.id);
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }

  // Future<List<ProductModel>> getPendingProducts() async {
  //   return localDatasource.getPendingProducts();
  // }

  @override
  BaseResponse<Unit> sync(Unit unit) async {
    try {
      // final hasNetwork = await networkChecker.isConnected();
      // if (!hasNetwork) return right(unit);

      final pendingProducts = await localDatasource.getPendingProducts();

      print(pendingProducts.map((e) => e.id));
      for (final product in pendingProducts) {
        try {
          if (product.id == 0) {
            // create on server
            final params = Params(body: product.toJson()..remove('id'));
            final model = await remoteDatasource.createProduct(params);

            final syncedModel = product.copyWith(id: model.id);
            await localDatasource.addOrUpdateProduct(syncedModel, synced: true);
          } else {
            // update on server
            final params = Params(
              body: product.toJson(),
              endPoint: product.id.toString(),
            );

            await remoteDatasource.updateProduct(params);

            await localDatasource.addOrUpdateProduct(product, synced: true);
          }
        } catch (_) {
          // ignore, retry later
        }
      }

      return right(unit);
    } on ErrorException catch (e) {
      return left(e.toFailure());
    }
  }
}
