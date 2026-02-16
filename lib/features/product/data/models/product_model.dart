import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:merchant_product/features/product/domain/domain.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  ProductModel._();
  factory ProductModel({
    required int id,
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
}
