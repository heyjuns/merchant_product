import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:merchant_product/core/extensions/num_extensions.dart';
import 'package:merchant_product/features/product/domain/domain.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../controller/product/product_bloc.dart';
import '../widget/status_dot_widget.dart';

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
      header: FHeader(
        title: Text('Product Detail'),
        suffixes: [
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: (product) => Skeletonizer(
                  enabled: true,
                  child: StatusDotWidget(status: product.status),
                ),
                loaded: (product) => StatusDotWidget(status: product.status),
                orElse: () => SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: (product) =>
                Skeletonizer(enabled: true, child: _Content(product: product)),
            loaded: (product) => _Content(product: product),
            orElse: () => SizedBox(),
          );
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final ProductEntity product;
  const _Content({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              product.name,
              style: context.theme.typography.xl3.copyWith(fontWeight: .bold),
            ),
            Text(product.description),
          ],
        ),
        Divider(),
        FItem(title: Text('Price'), details: Text(product.price.currency)),
        Divider(),
        FItem(title: Text('Status'), details: Text(product.status.name)),
        Divider(),
        FItem(
          title: Text('Updated'),
          details: Text(() {
            final date = product.updatedAt;

            const months = [
              'Jan',
              'Feb',
              'Mar',
              'Apr',
              'May',
              'Jun',
              'Jul',
              'Aug',
              'Sep',
              'Oct',
              'Nov',
              'Dec',
            ];

            final day = date.day.toString().padLeft(2, '0');
            final month = months[date.month - 1];
            final year = date.year.toString();
            final hour = date.hour.toString().padLeft(2, '0');
            final minute = date.minute.toString().padLeft(2, '0');
            final second = date.second.toString().padLeft(2, '0');

            return '$day $month $year | $hour:$minute:$second';
          }()),
        ),
        Divider(),
        SizedBox(height: 16),
        FButton(onPress: () {}, prefix: Icon(Icons.edit), child: Text('Edit')),
      ],
    );
  }
}
