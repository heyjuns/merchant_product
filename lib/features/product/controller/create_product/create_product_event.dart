part of 'create_product_bloc.dart';

@freezed
abstract class CreateProductEvent with _$CreateProductEvent {
  const factory CreateProductEvent.fetch({required CreateProductDto dto}) =
      _Fetch;
}
