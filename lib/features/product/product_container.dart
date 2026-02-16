import 'package:merchant_product/core/service_locator.dart';

import 'controller/controller.dart';
import 'data/data.dart';
import 'data/repositories/repositories.dart';
import 'domain/domain.dart';

Future<void> initProductInjection() async {
  sl.registerFactory(() => ProductBloc(getProductUsecase: sl()));
  sl.registerFactory(() => ProductsBloc(getProductsUseCase: sl()));

  sl.registerLazySingleton(() => GetProductUsecase(sl()));
  sl.registerLazySingleton(() => GetProductsUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProductUsecase(sl()));
  sl.registerLazySingleton(() => CreateProductUsecase(sl()));

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDatasource: sl()),
  );
  sl.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(sl()),
  );
}
