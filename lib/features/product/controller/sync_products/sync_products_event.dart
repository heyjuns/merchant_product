part of 'sync_products_bloc.dart';

@freezed
class SyncProductsEvent with _$SyncProductsEvent {
  const factory SyncProductsEvent.started() = _Started;
}