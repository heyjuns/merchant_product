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

    // ✅ Start listening to the DB stream immediately when bloc is created
    _streamSubscription = streamProductsUsecase
        .call(Params(queryParameters: _paginationDto.toJson()))
        .listen((products) {
          final hasReachedMax = products.length < _paginationDto.limit;

          // Safe emit using addPostFrameCallback pattern
          if (!isClosed) {
            emit(
              ProductsState.loaded(
                products: products,
                hasReachedMax: hasReachedMax,
              ),
            );
          }
        });
  }

  Future<void> _onFetch(_Fetch event, Emitter<ProductsState> emit) async {
    _paginationDto = _paginationDto.copyWith(page: 1, limit: 10);

    emit(
      ProductsState.loading(
        products: List.generate(10, (_) => ProductEntity.init()),
      ),
    );

    // Trigger remote fetch safely
    await getProductsUseCase.call(
      Params(queryParameters: _paginationDto.toJson()),
    );
  }

  Future<void> _onLoadMore(_LoadMore event, Emitter<ProductsState> emit) async {
    final currentState = state;

    if (currentState is! _Loaded || currentState.hasReachedMax) return;

    _paginationDto = _paginationDto.copyWith(page: _paginationDto.page + 1);

    // Fire remote request for next page
    await getProductsUseCase.call(
      Params(queryParameters: _paginationDto.toJson()),
    );
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }
}
