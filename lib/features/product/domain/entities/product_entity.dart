import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'product_entity.freezed.dart';
part 'product_entity.g.dart';

@freezed
abstract class ProductEntity with _$ProductEntity {
  ProductEntity._();
  factory ProductEntity({
    required int id,
    required String name,
    required int price,
    required String description,
    required ProductStatus status,
    required DateTime updatedAt,
  }) = _ProductEntity;

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);

  factory ProductEntity.init() => ProductEntity(
    description: BoneMock.subtitle,
    id: 0,
    name: BoneMock.subtitle,
    price: 0,
    status: ProductStatus.unknown,
    updatedAt: DateTime.now(),
  );
}

enum ProductStatus { draft, active, unknown }
