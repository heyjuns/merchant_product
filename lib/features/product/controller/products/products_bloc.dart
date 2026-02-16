import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:merchant_product/core/core.dart';
// import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:merchant_product/features/product/product.dart';
part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUsecase getProductsUseCase;

  ProductsBloc({required this.getProductsUseCase})
    : super(const ProductsState.initial()) {
    on<_Fetch>(
      _onFetch,
      //  transformer: restartable(),
    );
    on<_LoadMore>(
      _onLoadMore,
      //  transformer: droppable(),
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

    await _fetchPage(emit, isRefresh: true);
  }

  Future<void> _onLoadMore(
    _LoadMore event,
    Emitter<ProductsState> emit,
  ) async {
    final currentState = state;

    if (currentState is! _Loaded || currentState.hasReachedMax) {
      return;
    }

    await _fetchPage(emit);
  }

  Future<void> _fetchPage(
    Emitter<ProductsState> emit, {
    bool isRefresh = false,
  }) async {
    final result = await getProductsUseCase.call(
      Params(queryParameters: _paginationDto.toJson()),
    );

    result.fold(
      (failure) {
        emit(ProductsState.failed(error: failure));
      },
      (List<ProductEntity> data) {
        _products.addAll(data);

        final hasReachedMax = _paginationDto.limit > data.length;

        if (!hasReachedMax) {
          _paginationDto = _paginationDto.copyWith(
            page: _paginationDto.page + 1,
          );
        }

        emit(
          ProductsState.loaded(
            products: List.unmodifiable(_products),
            hasReachedMax: hasReachedMax,
          ),
        );
      },
    );
  }
}
