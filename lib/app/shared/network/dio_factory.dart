import 'package:dio/dio.dart';

import '../../../main.dart';
import 'custom_interceptor.dart';

class DioFactory {
  late final Dio dio;

  DioFactory() {
    dio = Dio(BaseOptions(
      baseUrl: appConfig.apiBaseUrl
    ));
    dio.interceptors.add(CustomInterceptor(dio));
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
