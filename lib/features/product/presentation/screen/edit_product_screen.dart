import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:merchant_product/features/connectivity/controller/connectivity_check/connectivity_check_bloc.dart';

import '../../controller/controller.dart';
import '../widget/product_form_widget.dart';

class EditProductScreen extends HookWidget {
  final int id;
  const EditProductScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final productBloc = useBloc<ProductBloc>();
    final editProductBloc = useBloc<EditProductBloc>();

    useEffect(() {
      productBloc.add(ProductEvent.fetch(id));
      return null;
    }, []);

    useBlocListener(editProductBloc, (bloc, current, context) {
      current.whenOrNull(
        failed: (error) =>
            showFToast(context: context, title: Text(error.message)),
        loaded: () {
          final connection = context.read<ConnectivityCheckBloc>().state;
          connection.whenOrNull(
            online: () => context.read<SyncProductsBloc>().add(
              SyncProductsEvent.started(),
            ),
          );
          showFToast(
            context: context,
            title: Text('Product has been edited'),
            duration: Duration(seconds: 2),
          );
          context.pop(true);
        },
      );
    });

    return FScaffold(
      header: FHeader(title: Text('Edit Product')),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (product) => ProductFormWidget(
              initialData: product,
              onSubmit: (dto) {
                editProductBloc.add(EditProductEvent.fetch(id: id, dto: dto));
              },
            ),
            orElse: () => SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
