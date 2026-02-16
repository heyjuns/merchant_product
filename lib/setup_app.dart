import 'dart:io';

import 'package:dio/dio.dart';
import 'package:merchant_product/features/product/product_container.dart';

import 'core/http_overrides.dart';
import 'core/service_locator.dart';

Future<void> setupApp() async {
  HttpOverrides.global = CustomHttpOverrides();

  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options.baseUrl = 'http://10.0.2.2:3000';
    return dio;
  });

  initProductInjection();
}
