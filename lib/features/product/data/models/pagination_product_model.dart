import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'product_model.dart';
part 'pagination_product_model.freezed.dart';
part 'pagination_product_model.g.dart';

@freezed
abstract class PaginationProductModel with _$PaginationProductModel {
  factory PaginationProductModel({
    required int total,
    required List<ProductModel> products,
  }) = _PaginationProductModel;

  factory PaginationProductModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationProductModelFromJson(json);
}
