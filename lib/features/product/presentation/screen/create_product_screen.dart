import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

import '../../controller/controller.dart';
import '../widget/product_form_widget.dart';

class CreateProductScreen extends HookWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: ProductFormWidget(
        onSubmit: (dto) {
          createProductBloc.add(CreateProductEvent.fetch(dto: dto));
        },
      ),
    );
  }
}
