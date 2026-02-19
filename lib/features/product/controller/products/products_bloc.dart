import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:merchant_product/core/core.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:merchant_product/features/product/product.dart';
part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUsecase getProductsUseCase;
  final StreamProductsUsecase streamProductsUsecase;

  final List<ProductEntity> products = [];
  final List<ProductEntity> dummies = List.generate(
    10,
    (_) => ProductEntity.init(),
  );
  ProductsDto paginationDto = ProductsDto.init();
  int get visibleCount => paginationDto.page * paginationDto.limit;
  List<ProductEntity> get visibleProducts =>
      products.take(visibleCount).toList();
  bool get hasReachedMax => visibleProducts.length >= totalCount;
  int totalCount = 0;

  ProductsBloc({
    required this.getProductsUseCase,
    required this.streamProductsUsecase,
  }) : super(const ProductsState.initial()) {
    on<_Fetch>((event, emit) async {
      products.clear();
      paginationDto = ProductsDto.init();

      emit(ProductsState.loading(products: dummies));

      final response = await getProductsUseCase.call(
        Params(queryParameters: paginationDto.toJson()),
      );
      response.fold((_) {}, (r) {
        totalCount = r;
      });

      await emit.forEach<List<ProductEntity>>(
        streamProductsUsecase.call(Params()),
        onData: (data) {
          products
            ..clear()
            ..addAll(data);

          return ProductsState.loaded(
            products: visibleProducts,
            hasReachedMax: hasReachedMax,
          );
        },
      );
    }, transformer: restartable());
    on<_LoadMore>((event, emit) {
      final currentState = state;

      if (currentState is! _Loaded || currentState.hasReachedMax) return;

      final nextPage = paginationDto.page + 1;
      final nextVisibleCount = nextPage * paginationDto.limit;

      if (products.length >= nextVisibleCount) {
        paginationDto = paginationDto.copyWith(page: nextPage);
        return emitLoaded(emit);
      }

      paginationDto = paginationDto.copyWith(page: nextPage);

      unawaited(
        getProductsUseCase.call(
          Params(queryParameters: paginationDto.toJson()),
        ),
      );
    }, transformer: droppable());
  }

  void emitLoaded(Emitter<ProductsState> emit) {
    emit(
      ProductsState.loaded(
        products: visibleProducts,
        hasReachedMax: hasReachedMax,
      ),
    );
  }
}
