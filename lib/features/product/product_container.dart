import 'package:merchant_product/core/service_locator.dart';
import 'package:merchant_product/features/product/data/services/products_database.dart';

import 'controller/controller.dart';
import 'product.dart';

Future<void> initProductInjection() async {
  sl.registerFactory(() => ProductBloc(getProductUsecase: sl()));
  sl.registerFactory(() => ProductsBloc(getProductsUseCase: sl()));
  sl.registerFactory(() => CreateProductBloc(createProductUsecase: sl()));
  sl.registerFactory(() => EditProductBloc(updateProductUsecase: sl()));

  sl.registerLazySingleton(() => GetProductUsecase(sl()));
  sl.registerLazySingleton(() => GetProductsUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProductUsecase(sl()));
  sl.registerLazySingleton(() => CreateProductUsecase(sl()));
  sl.registerLazySingleton(() => ProductsDatabase());

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDatasource: sl(), localDatasource: sl()),
  );

  sl.registerLazySingleton<ProductLocalDatasource>(
    () => ProductLocalDatasourceImpl(sl()),
  );

  sl.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(sl()),
  );
}
