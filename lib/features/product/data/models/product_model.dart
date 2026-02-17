import 'package:drift/drift.dart' hide JsonKey;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:merchant_product/features/product/domain/domain.dart';

import '../services/products_database.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    int? localId,
    @JsonKey(name: 'id') int? serverId,

    required String name,
    required int price,
    required String description,
    required String status,
    required DateTime updatedAt,

    @Default(true) bool synced,
    DateTime? lastSyncedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  factory ProductModel.fromDb(ProductsTableData row) {
    return ProductModel(
      localId: row.localId,
      serverId: row.serverId,
      name: row.name,
      price: row.price,
      description: row.description,
      status: row.status,
      updatedAt: row.updatedAt,
      synced: row.synced,
      lastSyncedAt: row.lastSyncedAt,
    );
  }

  ProductsTableCompanion toCompanion() {
    return ProductsTableCompanion(
      localId: localId == null ? const Value.absent() : Value(localId!),
      serverId: Value(serverId),
      name: Value(name),
      price: Value(price),
      description: Value(description),
      status: Value(status),
      updatedAt: Value(updatedAt),
      synced: Value(synced),
      lastSyncedAt: Value(lastSyncedAt),
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: localId ?? serverId,
      name: name,
      price: price,
      description: description,
      status: switch (status) {
        'draft' => ProductStatus.draft,
        'active' => ProductStatus.active,
        _ => ProductStatus.unknown,
      },
      updatedAt: updatedAt,
    );
  }

  factory ProductModel.fromEntity(
    ProductEntity entity, {
    bool synced = false,
    bool deleted = false,
  }) {
    return ProductModel(
      serverId: entity.id,
      name: entity.name,
      price: entity.price,
      description: entity.description,
      status: entity.status.name,
      updatedAt: entity.updatedAt,
      synced: synced,
    );
  }

  CreateProductDto toCreateProductDto() {
    return CreateProductDto(
      name: name,
      price: price,
      status: status,
      description: description,
      updatedAt: DateTime.now().toIso8601String(),
    );
  }
}
