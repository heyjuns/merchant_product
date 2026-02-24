import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:merchant_product/core/core.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:merchant_product/features/product/product.dart';
part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUsecase _getProductsUseCase;
  final StreamProductsUsecase _streamProductsUsecase;

  final List<ProductEntity> _products = [];
  final List<ProductEntity> _dummies = List.generate(
    10,
    (_) => ProductEntity.init(),
  );
  ProductsDto _paginationDto = ProductsDto.init();
  int get _visibleCount => _paginationDto.page * _paginationDto.limit;
  List<ProductEntity> get _visibleProducts =>
      _products.take(_visibleCount).toList();
  bool get _hasReachedMax =>
      _visibleProducts.length >= (_totalCount ?? _products.length);
  int? _totalCount;

  ProductsBloc({
    required GetProductsUsecase getProductsUseCase,
    required StreamProductsUsecase streamProductsUsecase,
  }) : _streamProductsUsecase = streamProductsUsecase,
       _getProductsUseCase = getProductsUseCase,
       super(const ProductsState.initial()) {
    on<_Fetch>((event, emit) async {
      _products.clear();
      _paginationDto = ProductsDto.init();

      emit(ProductsState.loading(products: _dummies));

      final response = await _getProductsUseCase.call(_paginationDto);
      response.fold((_) {}, (r) {
        _totalCount = r;
      });

      await emit.forEach<List<ProductEntity>>(
        _streamProductsUsecase.call(unit),
        onData: (data) {
          _products
            ..clear()
            ..addAll(data);

          return ProductsState.loaded(
            products: _visibleProducts,
            hasReachedMax: _hasReachedMax,
          );
        },
      );
    }, transformer: restartable());
    on<_LoadMore>((event, emit) {
      final currentState = state;

      if (currentState is! _Loaded || currentState.hasReachedMax) return;

      final nextPage = _paginationDto.page + 1;
      if (_visibleProducts.length < _products.length) {
        _paginationDto = _paginationDto.copyWith(page: nextPage);
        return _emitLoaded(emit);
      }

      _paginationDto = _paginationDto.copyWith(page: nextPage);

      unawaited(_getProductsUseCase.call(_paginationDto));
    }, transformer: droppable());
  }

  void _emitLoaded(Emitter<ProductsState> emit) {
    emit(
      ProductsState.loaded(
        products: _visibleProducts,
        hasReachedMax: _hasReachedMax,
      ),
    );
  }
}
