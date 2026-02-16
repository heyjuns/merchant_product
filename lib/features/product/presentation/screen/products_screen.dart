import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:merchant_product/features/product/router/router.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Products')),
      child: Column(
        children: [
          FButton(
            onPress: () {
              context.pushNamed(
                ProductRoutes.product.name,
                pathParameters: {'id': '1'},
              );
            },
            child: Text('Test'),
          ),
        ],
      ),
    );
  }
}
