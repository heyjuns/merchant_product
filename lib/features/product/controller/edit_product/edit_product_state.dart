part of 'edit_product_bloc.dart';

@freezed
class EditProductState with _$EditProductState {
  const factory EditProductState.initial() = _Initial;
  const factory EditProductState.loading() = _Loading;
  const factory EditProductState.loaded() = _Loaded;
  const factory EditProductState.failed({required Failure error}) = _Failed;
}
