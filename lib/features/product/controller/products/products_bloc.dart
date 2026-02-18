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
  }

  final List<ProductEntity> _products = [];
  ProductsDto _paginationDto = ProductsDto.init();

  /// ================= FETCH =================

  Future<void> _onFetch(_Fetch event, Emitter<ProductsState> emit) async {
    _products.clear();
    _paginationDto = _paginationDto.copyWith(page: 1, limit: 10000);

    emit(
      ProductsState.loading(
        products: List.generate(4, (_) => ProductEntity.init()),
      ),
    );

    unawaited(
      getProductsUseCase.call(Params(queryParameters: _paginationDto.toJson())),
    );

    await emit.forEach<List<ProductEntity>>(
      streamProductsUsecase.call(
        Params(queryParameters: _paginationDto.toJson()),
      ),
      onData: (data) {
        _products
          ..clear()
          ..addAll(data);

        final hasReachedMax = data.length < _paginationDto.limit;

        if (!hasReachedMax) {
          _paginationDto = _paginationDto.copyWith(
            page: _paginationDto.page + 1,
          );
        }

        return ProductsState.loaded(
          products: List.unmodifiable(_products),
          hasReachedMax: true,
        );
      },
    );
  }

  /// ================= LOAD MORE =================

  Future<void> _onLoadMore(_LoadMore event, Emitter<ProductsState> emit) async {
    final currentState = state;

    if (currentState is! _Loaded || currentState.hasReachedMax) return;

    await getProductsUseCase.call(
      Params(queryParameters: _paginationDto.toJson()),
    );
  }
}
