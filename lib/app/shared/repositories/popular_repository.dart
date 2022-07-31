import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_test_app/app/shared/models/popular_people_model.dart';
import 'package:movie_test_app/main.dart';

import '../network/error_helper.dart';
import '../network/movies_app_exception.dart';

class PopularRepository {
  final Dio _dio;

  PopularRepository(Dio client) : _dio = client;

  Future<PopularPeopleModel?> getPopularPeople(int page) async {
    try {
      final response = await _dio.get('/3/person/popular', queryParameters: {
        "api_key": appConfig.apiKey,
        "language": "en=US",
        "page": page
      });
      if (response.statusCode == 200) {
        return popularPeopleModelFromJson(json.encode(response.data));
      } else {
        throw MoviesAppException('Empty Repository');
      }
    } on DioError catch (e, s) {
      ErrorHelper.handle('Something wrong', e, s);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
