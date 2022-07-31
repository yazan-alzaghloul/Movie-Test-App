import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_test_app/app/shared/models/api_error.dart';
import 'package:movie_test_app/app/shared/network/movies_app_exception.dart';

class ErrorHelper {
  static void handle(String defaultMessageError, DioError e, StackTrace s) {
    try {
      if (e.error is MoviesAppException) throw e.error;
      if (e.response != null &&
          e.response!.statusCode! >= 400 &&
          e.response!.statusCode! < 500) {
        final data = ApiError.fromJson(json.decode(e.response?.data));
        String messages = '';
        data.errors?.forEach((error) =>
            error.messages?.forEach((message) => messages += '$message\n'));
        throw MoviesAppException(messages.trim(), innerException: e);
      } else {
        throw MoviesAppException('No Response', innerException: e);
      }
    } on MoviesAppException catch (_) {
      rethrow;
    } catch (e) {
      throw MoviesAppException('General Error', innerException: e);
    }
  }
}
