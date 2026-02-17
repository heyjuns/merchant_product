import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:merchant_product/core/error/failure.dart';
import 'package:merchant_product/features/product/domain/domain.dart';

part 'sync_products_event.dart';
part 'sync_products_state.dart';
part 'sync_products_bloc.freezed.dart';

class SyncProductsBloc extends Bloc<SyncProductsEvent, SyncProductsState> {
  final SyncProductsUsecase syncProductsUsecase;
  SyncProductsBloc({required this.syncProductsUsecase})
    : super(SyncProductsState.initial()) {
    on<_Started>((event, emit) async {
      emit(SyncProductsState.loading());
      final result = await syncProductsUsecase.call(unit);

      result.fold(
        (l) => emit(SyncProductsState.failed(error: l)),
        (r) => emit(SyncProductsState.success()),
      );
    });
  }
}
