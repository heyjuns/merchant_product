import 'package:dio/dio.dart';
import 'package:fpdart/src/unit.dart';
import 'package:merchant_product/core/error/error_exception.dart';

import 'package:merchant_product/core/params.dart';

import 'package:merchant_product/core/typedefs.dart';

import '../../domain/domain.dart';
import '../models/models.dart';

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final Dio dio;

  ProductRemoteDatasourceImpl(this.dio);

  @override
  FutureResponse<Unit> createProduct(Params params) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  FutureResponse<ProductModel> getProduct(Params params) async {
    try {
      final response = await dio.get(
        '/products/${params.endPoint}',
        cancelToken: params.cancelToken,
      );
      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data);
      } else if (response.statusCode == 409) {
        throw const ConflictException(
          message: 'Product version conflict detected',
        );
      } else {
        throw ServerException(
          message: 'Server error',
          code: response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw const NetworkException(message: 'No internet connection');
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        throw const TimeoutException(message: 'Request timeout');
      }

      throw ServerException(
        message: e.message ?? 'Unexpected server error',
        code: e.response?.statusCode,
      );
    }
  }

  @override
  FutureResponse<List<ProductModel>> getProducts(Params params) {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  FutureResponse<Unit> updateProduct(Params params) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
