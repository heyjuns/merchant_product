part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading({required ProductEntity product}) =
      _Loading;
  const factory ProductState.loaded({required ProductEntity product}) = _Loaded;
  const factory ProductState.failed({required Failure error}) = _Failed;
}
