import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import '../../controller/product/product_bloc.dart';

class ProductScreen extends HookWidget {
  final int id;
  const ProductScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final productBloc = useBloc<ProductBloc>();
    useEffect(() {
      productBloc.add(ProductEvent.fetch(id));
      return null;
    }, []);

    useBlocListener(productBloc, (bloc, current, context) {
      current.whenOrNull(
        initial: () =>
            showFToast(context: context, title: const Text('Initial')),
        loaded: (product) =>
            showFToast(context: context, title: Text(product.name)),
        failed: (error) =>
            showFToast(context: context, title: Text(error.message)),
      );
    });

    return FScaffold(
      header: FHeader(title: Text('Product ${id}')),
      child: SizedBox(),
    );
  }
}
