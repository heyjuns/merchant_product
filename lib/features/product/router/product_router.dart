import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:merchant_product/core/service_locator.dart';
import 'package:merchant_product/features/product/product.dart';

import '../controller/controller.dart';

abstract class ProductRouter {
  static List<GoRoute> get routes => [
    GoRoute(
      path: ProductRoutes.products.path,
      name: ProductRoutes.products.name,
      builder: (_, state) => BlocProvider(
        create: (_) => sl<ProductsBloc>(),
        child: ProductsScreen(),
      ),
    ),
    GoRoute(
      path: ProductRoutes.product.path,
      name: ProductRoutes.product.name,
      builder: (_, state) => BlocProvider(
        create: (_) => sl<ProductBloc>(),
        child: ProductScreen(id: int.parse(state.pathParameters['id']!)),
      ),
    ),
    GoRoute(
      path: ProductRoutes.create.path,
      name: ProductRoutes.create.name,
      builder: (_, state) => BlocProvider(
        create: (context) => sl<CreateProductBloc>(),
        child: CreateProductScreen(),
      ),
    ),
    GoRoute(
      path: ProductRoutes.edit.path,
      name: ProductRoutes.edit.name,
      builder: (_, state) => EditProductScreen(),
    ),
  ];
}
