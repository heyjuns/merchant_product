import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';

import '../../product.dart';
import '../services/products_database.dart';

class ProductLocalDatasourceImpl extends DatabaseAccessor<ProductsDatabase>
    implements ProductLocalDatasource {
  final ProductsDatabase db;
  ProductLocalDatasourceImpl(this.db) : super(db);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await select(db.productsTable).get();
    return response.map((item) => ProductModel.fromDbRow(item)).toList();
  }

  @override
  Future<Unit> addOrUpdateProduct(
    ProductModel product, {
    bool synced = false,
  }) async {
    await into(
      db.productsTable,
    ).insertOnConflictUpdate(product.toCompanion(synced: synced));
    return unit;
  }

  @override
  Future<List<ProductModel>> getPendingProducts() async {
    final rows = await (select(
      db.productsTable,
    )..where((t) => t.synced.equals(false))).get();

    return rows.map((row) => ProductModel.fromDbRow(row)).toList();
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    final row = await (select(
      db.productsTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();

    if (row == null) {
      throw Exception("Product with id $id not found");
    }

    return ProductModel.fromDbRow(row);
  }
}
