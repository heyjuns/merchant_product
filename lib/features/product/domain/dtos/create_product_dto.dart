import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'create_product_dto.freezed.dart';
part 'create_product_dto.g.dart';

@freezed
abstract class CreateProductDto with _$CreateProductDto {
  factory CreateProductDto({
    required String name,
    required int price,
    required String status,
    required String description,
    required String updatedAt,
  }) = _CreateProductDto;

  factory CreateProductDto.fromJson(Map<String, dynamic> json) =>
      _$CreateProductDtoFromJson(json);
}
