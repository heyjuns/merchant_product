part of 'edit_product_bloc.dart';

@freezed
abstract class EditProductEvent with _$EditProductEvent {
  const factory EditProductEvent.fetch({
    required int id,
    required CreateProductDto dto,
  }) = _Fetch;
}
