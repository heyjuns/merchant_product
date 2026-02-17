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

  ProductsDto _paginationDto = ProductsDto.init();

  Future<void> _onFetch(_Fetch event, Emitter<ProductsState> emit) async {
    _paginationDto = _paginationDto.copyWith(page: 1, limit: 10);

    emit(
      ProductsState.loading(
        products: List.generate(10, (_) => ProductEntity.init()),
      ),
    );

    // 1️⃣ Start listening to DB
    await emit.forEach(
      streamProductsUsecase(Params(queryParameters: _paginationDto.toJson())),
      onData: (products) {
        final hasReachedMax = products.length < _paginationDto.limit;

        return ProductsState.loaded(
          products: products,
          hasReachedMax: hasReachedMax,
        );
      },
    );

    // 2️⃣ Trigger remote refresh
    await getProductsUseCase(Params(queryParameters: _paginationDto.toJson()));
  }

  Future<void> _onLoadMore(_LoadMore event, Emitter<ProductsState> emit) async {
    final currentState = state;

    if (currentState is! _Loaded || currentState.hasReachedMax) {
      return;
    }

    _paginationDto = _paginationDto.copyWith(page: _paginationDto.page + 1);

    // Just trigger refresh for next page
    await getProductsUseCase(Params(queryParameters: _paginationDto.toJson()));
  }
}
