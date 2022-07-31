import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  final Dio _dio;

  CustomInterceptor(Dio dio) : _dio = dio;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err); //continue

  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response); //continue

  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options); //continue
  }
}
