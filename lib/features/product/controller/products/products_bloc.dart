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

  StreamSubscription<List<ProductEntity>>? _streamSubscription;

  ProductsDto _paginationDto = ProductsDto.init();

  ProductsBloc({
    required this.getProductsUseCase,
    required this.streamProductsUsecase,
  }) : super(const ProductsState.initial()) {
    on<_Fetch>(_onFetch, transformer: restartable());
    on<_LoadMore>(_onLoadMore, transformer: droppable());
    on<_ProductsUpdated>(_onProductsUpdated);
  }

  Future<void> _startListening() async {
    await _streamSubscription?.cancel();

    _streamSubscription = streamProductsUsecase
        .call(Params(queryParameters: _paginationDto.toJson()))
        .listen((products) {
          add(ProductsEvent.productsUpdated(products));
        });
  }

  Future<void> _onFetch(_Fetch event, Emitter<ProductsState> emit) async {
    _paginationDto = _paginationDto.copyWith(page: 1, limit: 10);

    emit(
      ProductsState.loading(
        products: List.generate(10, (_) => ProductEntity.init()),
      ),
    );

    await _startListening();

    await getProductsUseCase.call(
      Params(queryParameters: _paginationDto.toJson()),
    );
  }

  Future<void> _onLoadMore(_LoadMore event, Emitter<ProductsState> emit) async {
    final currentState = state;

    if (currentState is! _Loaded || currentState.hasReachedMax) return;

    _paginationDto = _paginationDto.copyWith(page: _paginationDto.page + 1);

    await _startListening();

    await getProductsUseCase.call(
      Params(queryParameters: _paginationDto.toJson()),
    );
  }

  void _onProductsUpdated(_ProductsUpdated event, Emitter<ProductsState> emit) {
    final hasReachedMax = event.products.length < _paginationDto.limit;

    emit(
      ProductsState.loaded(
        products: event.products,
        hasReachedMax: hasReachedMax,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }
}
