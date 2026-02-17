import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:merchant_product/core/error/failure.dart';
import 'package:merchant_product/core/params.dart';
import 'package:merchant_product/features/product/domain/domain.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';
part 'create_product_bloc.freezed.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  CreateProductUsecase createProductUsecase;
  CreateProductBloc({required this.createProductUsecase})
    : super(CreateProductState.initial()) {
    on<_Fetch>((event, emit) async {
      emit(CreateProductState.loading());
      final result = await createProductUsecase.call(
        Params(body: event.dto.toJson()),
      );

      result.fold(
        (l) => emit(CreateProductState.failed(error: l)),
        (r) => emit(CreateProductState.loaded()),
      );
    });
  }
}
