part of 'create_product_bloc.dart';

@freezed
class CreateProductState with _$CreateProductState {
  const factory CreateProductState.initial() = _Initial;
  const factory CreateProductState.loading() = _Loading;
  const factory CreateProductState.loaded() = _Loaded;
  const factory CreateProductState.failed({required Failure error}) = _Failed;
}
