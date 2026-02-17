import 'package:merchant_product/core/service_locator.dart';

import 'controller/controller.dart';
import 'data/services/products_database.dart';
import 'product.dart';

Future<void> initProductInjection() async {
  sl.registerFactory(() => ProductBloc(getProductUsecase: sl()));
  sl.registerFactory(
    () => ProductsBloc(getProductsUseCase: sl(), streamProductsUsecase: sl()),
  );
  sl.registerFactory(() => CreateProductBloc(createProductUsecase: sl()));
  sl.registerFactory(() => EditProductBloc(updateProductUsecase: sl()));

  sl.registerLazySingleton(() => GetProductUsecase(sl()));
  sl.registerLazySingleton(() => GetProductsUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProductUsecase(sl()));
  sl.registerLazySingleton(() => CreateProductUsecase(sl()));
  sl.registerLazySingleton(() => StreamProductsUsecase(sl()));
  sl.registerLazySingleton(() => ProductsDatabase());

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(local: sl(), remote: sl()),
  );

  sl.registerLazySingleton<ProductLocalDatasource>(
    () => ProductLocalDatasourceImpl(sl()),
  );

  sl.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(sl()),
  );
}
