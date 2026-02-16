part of 'products_bloc.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.fetch() = _Fetch;
  const factory ProductsEvent.loadMore() = _LoadMore;
}
