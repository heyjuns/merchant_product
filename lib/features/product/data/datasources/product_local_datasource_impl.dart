import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';
import 'package:merchant_product/core/params.dart';

import '../../product.dart';
import '../services/products_database.dart';

class ProductLocalDatasourceImpl extends DatabaseAccessor<ProductsDatabase>
    implements ProductLocalDatasource {
  final ProductsDatabase db;

  ProductLocalDatasourceImpl(this.db) : super(db);

  // ==========================================================
  // GET ALL (non-stream)
  // ==========================================================

  @override
  Future<List<ProductModel>> getProducts(Params params) async {
    final productsDto = ProductsDto.fromJson(params.queryParameters!);
    final offset = (productsDto.page - 1) * productsDto.limit;

    final rows =
        await (select(db.productsTable)
              ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)])
              ..limit(productsDto.limit, offset: offset))
            .get();

    return rows.map(ProductModel.fromDb).toList();
  }

  // ==========================================================
  // WATCH ALL (Reactive)
  // ==========================================================
  @override
  Stream<List<ProductModel>> watchProducts(Params params) {
    final productsDto = ProductsDto.fromJson(params.queryParameters!);
    final offset = (productsDto.page - 1) * productsDto.limit;

    return (select(db.productsTable)
          ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)])
          ..limit(productsDto.limit, offset: offset))
        .watch()
        .map((rows) => rows.map(ProductModel.fromDb).toList());
  }

  // ==========================================================
  // FIND BY SERVER ID
  // ==========================================================
  @override
  Future<ProductModel?> getProductById(int serverId) async {
    final row = await (select(
      db.productsTable,
    )..where((tbl) => tbl.serverId.equals(serverId))).getSingleOrNull();

    return row == null ? null : ProductModel.fromDb(row);
  }

  // ==========================================================
  // INSERT OR UPDATE
  // ==========================================================
  @override
  Future<Unit> addOrUpdateProduct(ProductModel model) async {
    await into(db.productsTable).insertOnConflictUpdate(model.toCompanion());
    return unit;
  }

  // ==========================================================
  // GET PENDING SYNC
  // ==========================================================
  @override
  Future<List<ProductModel>> getPendingProducts() async {
    final rows = await (select(
      db.productsTable,
    )..where((tbl) => tbl.synced.equals(false))).get();

    return rows.map(ProductModel.fromDb).toList();
  }
}
