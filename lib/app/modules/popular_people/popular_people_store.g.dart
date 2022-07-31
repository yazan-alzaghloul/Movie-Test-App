// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_people_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PopularPeopleStore on _PopularPeopleBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_PopularPeopleBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$popularPeopleModelAtom =
      Atom(name: '_PopularPeopleBase.popularPeopleModel', context: context);

  @override
  PopularPeopleModel? get popularPeopleModel {
    _$popularPeopleModelAtom.reportRead();
    return super.popularPeopleModel;
  }

  @override
  set popularPeopleModel(PopularPeopleModel? value) {
    _$popularPeopleModelAtom.reportWrite(value, super.popularPeopleModel, () {
      super.popularPeopleModel = value;
    });
  }

  late final _$resultsAtom =
      Atom(name: '_PopularPeopleBase.results', context: context);

  @override
  List<Result>? get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(List<Result>? value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  late final _$getPopularPeopleAsyncAction =
      AsyncAction('_PopularPeopleBase.getPopularPeople', context: context);

  @override
  Future<void> getPopularPeople(int page) {
    return _$getPopularPeopleAsyncAction
        .run(() => super.getPopularPeople(page));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
popularPeopleModel: ${popularPeopleModel},
results: ${results}
    ''';
  }
}
