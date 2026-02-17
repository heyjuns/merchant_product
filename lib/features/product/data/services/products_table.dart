import 'package:drift/drift.dart';

class ProductsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  IntColumn get price => integer()();
  TextColumn get description => text()();
  TextColumn get status => text()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get synced => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}
