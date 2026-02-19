import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';
import 'package:merchant_product/core/params.dart';

import '../../product.dart';
import '../services/products_database.dart';

class ProductLocalDatasourceImpl extends DatabaseAccessor<ProductsDatabase>
    implements ProductLocalDatasource {
  final ProductsDatabase db;

  ProductLocalDatasourceImpl(this.db) : super(db);

  @override
  Stream<List<ProductModel>> watchProducts(Params params) {
    return (select(db.productsTable)
          ..orderBy([(t) => OrderingTerm.asc(t.localId)]))
        .watch()
        .map((rows) => rows.map(ProductModel.fromDb).toList());
  }

  @override
  Future<ProductModel?> getProductById(int localId) async {
    final row = await (select(
      db.productsTable,
    )..where((tbl) => tbl.localId.equals(localId))).getSingleOrNull();

    return row == null ? null : ProductModel.fromDb(row);
  }

  @override
  Future<ProductModel?> getProductByServerId(int id) async {
    final row = await (select(
      db.productsTable,
    )..where((tbl) => tbl.serverId.equals(id))).getSingleOrNull();

    return row == null ? null : ProductModel.fromDb(row);
  }

  @override
  Future<Unit> addOrUpdateProduct(ProductModel model) async {
    await into(db.productsTable).insertOnConflictUpdate(model.toCompanion());
    return unit;
  }

  @override
  Future<List<ProductModel>> getPendingProducts() async {
    final rows = await (select(
      db.productsTable,
    )..where((tbl) => tbl.synced.equals(false))).get();

    return rows.map(ProductModel.fromDb).toList();
  }
}
