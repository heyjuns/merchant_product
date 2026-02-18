import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:merchant_product/core/core.dart';
import 'package:merchant_product/features/connectivity/controller/connectivity_check/connectivity_check_bloc.dart';
import 'package:merchant_product/features/product/controller/sync_products/sync_products_bloc.dart';
import 'package:merchant_product/setup_app.dart';

import 'app_router.dart';

Future<void> main() async {
  await setupApp();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FThemes.neutral.light;

    return MaterialApp.router(
      theme: theme.toApproximateMaterialTheme(),
      builder: (_, child) => FTheme(
        data: theme,
        child: FToaster(
          child: FTooltipGroup(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      sl<ConnectivityCheckBloc>()
                        ..add(ConnectivityCheckEvent.check()),
                ),
                BlocProvider(create: (context) => sl<SyncProductsBloc>()),
              ],
              child: AppShell(child: child!),
            ),
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}

class AppShell extends HookWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final connectivityBloc = useBloc<ConnectivityCheckBloc>();
    final syncProductsBloc = useBloc<SyncProductsBloc>();

    useBlocListener(connectivityBloc, (bloc, current, context) {
      current.whenOrNull(
        offline: () => showFToast(
          context: context,
          title: Text('Device is offline'),
          alignment: .bottomCenter,
          duration: Duration(seconds: 1),
        ),
        online: () {
          syncProductsBloc.add(SyncProductsEvent.started());
          showFToast(
            context: context,
            title: Text('Device is Online'),
            duration: Duration(seconds: 1),
            alignment: .bottomCenter,
          );
        },
      );
    });
    return BlocBuilder<ConnectivityCheckBloc, ConnectivityCheckState>(
      builder: (context, state) {
        return Stack(
          alignment: .bottomCenter,
          children: [
            child,
            Container(
              width: double.infinity,
              height: 4,
              color: state.maybeWhen(
                online: () => Colors.green,
                offline: () => context.theme.colors.destructive,
                orElse: () => null,
              ),
            ),
          ],
        );
      },
    );
  }
}
