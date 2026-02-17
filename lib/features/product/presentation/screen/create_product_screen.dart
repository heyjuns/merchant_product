import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:merchant_product/features/product/controller/create_product/create_product_bloc.dart';
import 'package:merchant_product/features/product/domain/domain.dart';

class CreateProductScreen extends HookWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final nameController = useTextEditingController();
    final priceController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final FMultiValueNotifier<ProductStatus> statusController =
        FMultiValueNotifier.radio();

    final createProductBloc = useBloc<CreateProductBloc>();

    useBlocListener(createProductBloc, (bloc, current, context) {
      current.whenOrNull(
        failed: (error) =>
            showFToast(context: context, title: Text(error.message)),
        loaded: () {
          showFToast(
            context: context,
            title: Text('Product has been created'),
            duration: Duration(seconds: 2),
          );
          context.pop();
        },
      );
    });

    return FScaffold(
      header: FHeader(title: Text('Create Product')),
      child: Form(
        key: key,
        child: Column(
          spacing: 12,
          children: [
            FTextFormField(
              label: const Text('Name'),
              autovalidateMode: .onUserInteraction,
              control: FTextFieldControl.managed(controller: nameController),
              validator: (value) =>
                  0 < (value?.length ?? 0) ? null : 'Name cannot be empty',
            ),
            FTextFormField.multiline(
              label: const Text('Description'),
              maxLines: 4,
              autovalidateMode: .onUserInteraction,
              control: FTextFieldControl.managed(
                controller: descriptionController,
              ),
              validator: (value) => 0 < (value?.length ?? 0)
                  ? null
                  : 'Description cannot be empty',
            ),
            FTextFormField(
              label: const Text('Price'),
              control: FTextFieldControl.managed(controller: priceController),
              keyboardType: .numberWithOptions(decimal: false, signed: false),
              autovalidateMode: .onUserInteraction,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                return 0 < (value?.length ?? 0)
                    ? null
                    : 'Price cannot be empty';
              },
            ),
            FSelectGroup<ProductStatus>(
              control: .managedRadio(controller: statusController),
              autovalidateMode: .onUserInteraction,
              label: const Text('Status'),
              validator: (values) =>
                  values?.isEmpty ?? true ? 'Please select a value.' : null,
              children: [
                .radio(value: .active, label: Text(ProductStatus.active.name)),
                .radio(value: .draft, label: Text(ProductStatus.draft.name)),
              ],
            ),
            SizedBox(height: 16),
            BlocBuilder<CreateProductBloc, CreateProductState>(
              builder: (context, state) {
                final isLoading = state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                );
                return FButton(
                  onPress: isLoading
                      ? null
                      : () {
                          if (!key.currentState!.validate()) {
                            // Form is valid, do something.
                            return;
                          }

                          createProductBloc.add(
                            CreateProductEvent.fetch(
                              dto: CreateProductDto(
                                name: nameController.text,
                                price: int.parse(priceController.text),
                                status: statusController.value.first.name,
                                description: descriptionController.text,
                                updatedAt: DateTime.now().toIso8601String(),
                              ),
                            ),
                          );
                        },
                  child: state.maybeWhen(
                    loading: () => FCircularProgress(),
                    orElse: () => Text('Create Product'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
