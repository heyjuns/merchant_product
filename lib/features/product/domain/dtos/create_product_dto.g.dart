// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateProductDto _$CreateProductDtoFromJson(Map<String, dynamic> json) =>
    _CreateProductDto(
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      status: json['status'] as String,
      description: json['description'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$CreateProductDtoToJson(_CreateProductDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'status': instance.status,
      'description': instance.description,
      'updatedAt': instance.updatedAt,
    };
