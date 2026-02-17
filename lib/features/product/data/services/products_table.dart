import 'package:drift/drift.dart';

class ProductsTable extends Table {
  IntColumn get localId => integer().autoIncrement()();
  IntColumn get serverId => integer().nullable()();
  TextColumn get name => text()();
  IntColumn get price => integer()();
  TextColumn get description => text()();
  TextColumn get status => text()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();

  @override
  List<Set<Column>> get uniqueKeys => [
    {localId},
  ];
}
