import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

part 'edit_product_event.dart';
part 'edit_product_state.dart';
part 'edit_product_bloc.freezed.dart';

class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
  final UpdateProductUsecase _updateProductUsecase;
  EditProductBloc({required UpdateProductUsecase updateProductUsecase})
    : _updateProductUsecase = updateProductUsecase,
      super(EditProductState.initial()) {
    on<_Fetch>((event, emit) async {
      emit(EditProductState.loading());
      final result = await _updateProductUsecase.call(event.dto);

      result.fold(
        (l) => emit(EditProductState.failed(error: l)),
        (r) => emit(EditProductState.loaded()),
      );
    });
  }
}
