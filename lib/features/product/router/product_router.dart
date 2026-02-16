import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:merchant_product/core/service_locator.dart';

import '../controller/controller.dart';
import '../presentation/screen/product_screen.dart';
import '../presentation/screen/products_screen.dart';
import 'product_routes.dart';

abstract class ProductRouter {
  static List<GoRoute> get routes => [
    GoRoute(
      path: ProductRoutes.products.path,
      name: ProductRoutes.products.name,
      builder: (_, state) => BlocProvider(
        create: (_) => sl<ProductBloc>(),
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
  ];
}
