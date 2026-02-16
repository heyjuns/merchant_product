part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loading({required List<ProductEntity> products}) =
      _Loading;
  const factory ProductsState.loaded({
    required List<ProductEntity> products,
    required bool hasReachedMax,
  }) = _Loaded;
  const factory ProductsState.failed({required Failure error}) = _Failed;
}
