import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:merchant_product/features/product/router/product_routes.dart';

import 'features/product/router/product_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  initialLocation: ProductRoutes.products.path,
  navigatorKey: navigatorKey,
  routes: [...ProductRouter.routes],
);
