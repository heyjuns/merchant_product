import 'package:dio/dio.dart';

class Params {
  final String? endPoint;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? body;
  final CancelToken? cancelToken;

  Params({this.endPoint, this.queryParameters, this.body, this.cancelToken});
}
