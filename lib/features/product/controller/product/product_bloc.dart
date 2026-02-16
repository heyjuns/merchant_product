import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:merchant_product/core/error/error.dart';
import 'package:merchant_product/core/params.dart';

import '../../domain/domain.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUsecase getProductUsecase;
  ProductBloc({required this.getProductUsecase})
    : super(const ProductState.initial()) {
    on<_Fetch>((event, emit) async {
      emit(ProductState.loading(product: ProductEntity.init()));
      final result = await getProductUsecase.call(
        Params(endPoint: event.id.toString()),
      );

      result.fold(
        (l) => emit(ProductState.failed(error: l)),
        (r) => emit(ProductState.loaded(product: r)),
      );
    });
  }
}
