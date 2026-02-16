import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    return FScaffold(
      header: FHeader(title: Text('Product $id')),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: (product) => Center(child: CircularProgressIndicator()),
            loaded: (product) => Center(child: Text(product.name)),
            failed: (error) => Center(child: Text(error.message)),
            initial: () => SizedBox(),
            orElse: () => SizedBox(),
          );
        },
      ),
    );
  }
}
