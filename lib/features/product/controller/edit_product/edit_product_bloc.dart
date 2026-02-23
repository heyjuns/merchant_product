import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

part 'edit_product_event.dart';
part 'edit_product_state.dart';
part 'edit_product_bloc.freezed.dart';

class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
  final UpdateProductUsecase updateProductUsecase;
  EditProductBloc({required this.updateProductUsecase})
    : super(EditProductState.initial()) {
    on<_Fetch>((event, emit) async {
      emit(EditProductState.loading());
      final result = await updateProductUsecase.call(event.dto);

      result.fold(
        (l) => emit(EditProductState.failed(error: l)),
        (r) => emit(EditProductState.loaded()),
      );
    });
  }
}
