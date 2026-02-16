// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductsDto _$ProductsDtoFromJson(Map<String, dynamic> json) => _ProductsDto(
  page: (json['_page'] as num).toInt(),
  limit: (json['_limit'] as num).toInt(),
);

Map<String, dynamic> _$ProductsDtoToJson(_ProductsDto instance) =>
    <String, dynamic>{'_page': instance.page, '_limit': instance.limit};
