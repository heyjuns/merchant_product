import 'package:merchant_product/core/service_locator.dart';
import 'package:merchant_product/features/connectivity/controller/connectivity_check/connectivity_check_bloc.dart';

Future<void> initConnectivityContainer() async {
  sl.registerLazySingleton(() => ConnectivityCheckBloc());
}
