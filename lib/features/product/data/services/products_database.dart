import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'products_table.dart';

part 'products_database.g.dart';

@DriftDatabase(tables: [ProductsTable])
class ProductsDatabase extends _$ProductsDatabase {
  ProductsDatabase({QueryExecutor? executor})
    : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'products_db',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
      ),
    );
  }
}
