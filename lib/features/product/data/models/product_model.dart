import 'package:drift/drift.dart' hide JsonKey;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:merchant_product/features/product/domain/domain.dart';

import '../services/products_database.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  ProductModel._();
  factory ProductModel({
    @Default(0) int id, // set 0 to support offline first
    required String name,
    required int price,
    required String description,
    required String status,
    required String updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  ProductEntity toEntity() => ProductEntity(
    id: id,
    name: name,
    price: price,
    description: description,
    status: switch (status) {
      'draft' => ProductStatus.draft,
      'active' => ProductStatus.active,
      _ => ProductStatus.unknown,
    },
    updatedAt: DateTime.parse(updatedAt),
  );

  factory ProductModel.fromDbRow(ProductsTableData row) {
    return ProductModel(
      id: row.id,
      name: row.name,
      price: row.price,
      description: row.description,
      status: row.status,
      updatedAt: row.updatedAt.toIso8601String(),
    );
  }

  ProductsTableCompanion toCompanion({bool synced = false}) {
    return ProductsTableCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
      description: Value(description),
      status: Value(status),
      updatedAt: Value(DateTime.parse(updatedAt)),
      synced: Value(synced),
    );
  }
}
