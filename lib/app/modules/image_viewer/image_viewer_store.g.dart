// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_viewer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImageViewerStore on _ImageViewerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ImageViewerBase.isLoading', context: context);

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

  late final _$mediaURLAtom =
      Atom(name: '_ImageViewerBase.mediaURL', context: context);

  @override
  String? get mediaURL {
    _$mediaURLAtom.reportRead();
    return super.mediaURL;
  }

  @override
  set mediaURL(String? value) {
    _$mediaURLAtom.reportWrite(value, super.mediaURL, () {
      super.mediaURL = value;
    });
  }

  late final _$setMediaAsyncAction =
      AsyncAction('_ImageViewerBase.setMedia', context: context);

  @override
  Future<void> setMedia(String url) {
    return _$setMediaAsyncAction.run(() => super.setMedia(url));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
mediaURL: ${mediaURL}
    ''';
  }
}
