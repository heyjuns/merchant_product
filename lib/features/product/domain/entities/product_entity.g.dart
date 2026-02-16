// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) =>
    _ProductEntity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      description: json['description'] as String,
      status: $enumDecode(_$ProductStatusEnumMap, json['status']),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ProductEntityToJson(_ProductEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'status': _$ProductStatusEnumMap[instance.status]!,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ProductStatusEnumMap = {
  ProductStatus.draft: 'draft',
  ProductStatus.active: 'active',
  ProductStatus.unknown: 'unknown',
};
