// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationProductModel _$PaginationProductModelFromJson(
  Map<String, dynamic> json,
) => _PaginationProductModel(
  total: (json['total'] as num).toInt(),
  products: (json['products'] as List<dynamic>)
      .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginationProductModelToJson(
  _PaginationProductModel instance,
) => <String, dynamic>{'total': instance.total, 'products': instance.products};
