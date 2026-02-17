import 'package:flutter/services.dart';
import 'package:forui/forui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:merchant_product/features/product/domain/domain.dart';

typedef OnSubmitProduct = void Function(CreateProductDto dto);

class ProductFormWidget extends HookWidget {
  final OnSubmitProduct onSubmit;
  final ProductEntity? initialData; // optional, for edit

  const ProductFormWidget({
    super.key,
    required this.onSubmit,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final nameController = useTextEditingController(
      text: initialData?.name ?? '',
    );
    final descriptionController = useTextEditingController(
      text: initialData?.description ?? '',
    );
    final priceController = useTextEditingController(
      text: initialData?.price.toString() ?? '',
    );
    final statusController = FMultiValueNotifier<ProductStatus>.radio(
      initialData != null
          ? ProductStatus.values.byName(initialData!.status.name)
          : null,
    );
    return Form(
      key: key,
      child: Column(
        spacing: 12,
        children: [
          FTextFormField(
            label: const Text('Name'),
            autovalidateMode: .onUserInteraction,
            control: FTextFieldControl.managed(controller: nameController),
            validator: (value) =>
                (value?.isNotEmpty ?? false) ? null : 'Name cannot be empty',
          ),
          FTextFormField.multiline(
            label: const Text('Description'),
            maxLines: 4,
            autovalidateMode: .onUserInteraction,
            control: FTextFieldControl.managed(
              controller: descriptionController,
            ),
            validator: (value) => (value?.isNotEmpty ?? false)
                ? null
                : 'Description cannot be empty',
          ),
          FTextFormField(
            label: const Text('Price'),
            control: FTextFieldControl.managed(controller: priceController),
            keyboardType: .numberWithOptions(decimal: false, signed: false),
            autovalidateMode: .onUserInteraction,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) =>
                (value?.isNotEmpty ?? false) ? null : 'Price cannot be empty',
          ),
          FSelectGroup<ProductStatus>(
            control: .managedRadio(controller: statusController),
            autovalidateMode: .onUserInteraction,
            label: const Text('Status'),
            validator: (values) =>
                (values?.isNotEmpty ?? false) ? null : 'Please select a value.',
            children: [
              .radio(value: .active, label: Text(ProductStatus.active.name)),
              .radio(value: .draft, label: Text(ProductStatus.draft.name)),
            ],
          ),
          const SizedBox(height: 16),
          FButton(
            onPress: () {
              if (!key.currentState!.validate()) return;

              final dto = CreateProductDto(
                name: nameController.text,
                price: int.parse(priceController.text),
                status: statusController.value.first.name,
                description: descriptionController.text,
                updatedAt: DateTime.now().toIso8601String(),
              );

              onSubmit(dto);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
