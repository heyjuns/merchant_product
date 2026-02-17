part of 'sync_products_bloc.dart';

@freezed
class SyncProductsState with _$SyncProductsState {
  const factory SyncProductsState.initial() = _Initial;
  const factory SyncProductsState.loading() = _Loading;
  const factory SyncProductsState.loaded() = _Loaded;
  const factory SyncProductsState.failed({required Failure error}) = _Failed;
}
