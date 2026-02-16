import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_dto.freezed.dart';
part 'products_dto.g.dart';

@freezed
abstract class ProductsDto with _$ProductsDto {
  ProductsDto._();
  factory ProductsDto({
    @JsonKey(name: '_page') required int page,
    @JsonKey(name: '_limit') required int limit,
  }) = _ProductsDto;

  factory ProductsDto.fromJson(Map<String, dynamic> json) =>
      _$ProductsDtoFromJson(json);

  factory ProductsDto.init() => ProductsDto(page: 1, limit: 10);
}
