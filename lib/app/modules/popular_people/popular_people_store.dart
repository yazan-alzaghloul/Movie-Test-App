import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_test_app/app/shared/network/movies_app_exception.dart';

import '../../shared/models/popular_people_model.dart';
import '../../shared/network/error_helper.dart';
import '../../shared/repositories/popular_repository.dart';
import '../../shared/widgets/toaster_widget.dart';

part 'popular_people_store.g.dart';

class PopularPeopleStore = _PopularPeopleBase with _$PopularPeopleStore;

abstract class _PopularPeopleBase with Store {
  final PopularRepository popularRepository;

  _PopularPeopleBase(this.popularRepository);

  @observable
  bool isLoading = false;

  @observable
  PopularPeopleModel? popularPeopleModel;

  @observable
  List<Result>? results = [];

  @action
  Future<void> getPopularPeople(int page) async {
    try {
      isLoading = true;
      await popularRepository.getPopularPeople(page).then((value) {
        popularPeopleModel = value;
        results?.addAll(value?.results ?? []);
      });
    } on MoviesAppException catch (e) {
      Toaster.error(message: e.message);
    } on DioError catch (e, s) {
      ErrorHelper.handle('Something wrong', e, s);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading = false;
    }
  }
}
