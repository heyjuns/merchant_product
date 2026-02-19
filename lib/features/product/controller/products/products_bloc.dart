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

  ProductsBloc({
    required this.getProductsUseCase,
    required this.streamProductsUsecase,
  }) : super(const ProductsState.initial()) {
    on<_Fetch>(_onFetch, transformer: restartable());
    on<_LoadMore>(_onLoadMore, transformer: droppable());
    on<_StreamUpdated>(_onStreamUpdated);
  }
  void _onStreamUpdated(_StreamUpdated event, Emitter<ProductsState> emit) {
    final visibleCount = _paginationDto.page * _paginationDto.limit;
    final visibleProducts = event.products.take(visibleCount).toList();
    final hasReachedMax = visibleProducts.length >= event.products.length;

    emit(
      ProductsState.loaded(
        products: visibleProducts,
        hasReachedMax: hasReachedMax,
      ),
    );
  }

  final List<ProductEntity> _products = [];
  ProductsDto _paginationDto = ProductsDto.init();

  Future<void> _onFetch(_Fetch event, Emitter<ProductsState> emit) async {
    _products.clear();
    _paginationDto = _paginationDto.copyWith(page: 1, limit: 10);

    emit(
      ProductsState.loading(
        products: List.generate(4, (_) => ProductEntity.init()),
      ),
    );

    unawaited(
      getProductsUseCase.call(Params(queryParameters: _paginationDto.toJson())),
    );

    await emit.forEach<List<ProductEntity>>(
      streamProductsUsecase.call(Params()),
      onData: (data) {
        _products
          ..clear()
          ..addAll(data);
        final visibleCount = _paginationDto.page * _paginationDto.limit;

        final visibleProducts = _products.take(visibleCount).toList();

        final hasReachedMax = visibleProducts.length == _products.length;

        return ProductsState.loaded(
          products: visibleProducts,
          hasReachedMax: hasReachedMax,
        );
      },
    );
  }

  void _onLoadMore(_LoadMore event, Emitter<ProductsState> emit) {
    final currentState = state;

    if (currentState is! _Loaded || currentState.hasReachedMax) return;

    final nextPage = _paginationDto.page + 1;
    final nextVisibleCount = nextPage * _paginationDto.limit;

    if (_products.length >= nextVisibleCount) {
      _paginationDto = _paginationDto.copyWith(page: nextPage);

      add(ProductsEvent.streamUpdated(_products));

      return;
    }
    unawaited(
      getProductsUseCase.call(Params(queryParameters: _paginationDto.toJson())),
    );
  }
}
