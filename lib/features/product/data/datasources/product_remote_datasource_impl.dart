import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:merchant_product/core/core.dart';

import '../../domain/domain.dart';
import '../models/models.dart';

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final Dio dio;

  ProductRemoteDatasourceImpl(this.dio);

  @override
  Future<ProductModel> createProduct(Params params) async {
    try {
      final response = await dio.post(
        '/products',
        data: params.body,
        cancelToken: params.cancelToken,
      );

      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw RemoteExceptionMapper.map(e);
    }
  }

  @override
  Future<ProductModel> getProduct(Params params) async {
    try {
      final response = await dio.get(
        '/products/${params.endPoint}',
        cancelToken: params.cancelToken,
      );

      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw RemoteExceptionMapper.map(e);
    }
  }

  @override
  Future<List<ProductModel>> getProducts(Params params) async {
    try {
      final response = await dio.get(
        '/products/',
        queryParameters: params.queryParameters,
        cancelToken: params.cancelToken,
      );

      return List.from(
        response.data as List,
      ).map((item) => ProductModel.fromJson(item)).toList();
    } catch (e) {
      throw RemoteExceptionMapper.map(e);
    }
  }

  @override
  Future<ProductModel> updateProduct(Params params) async {
    try {
      final response = await dio.put(
        '/products/${params.endPoint}',
        data: params.body,
        cancelToken: params.cancelToken,
      );

      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw RemoteExceptionMapper.map(e);
    }
  }
}
