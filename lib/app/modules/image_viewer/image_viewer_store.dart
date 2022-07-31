import 'package:mobx/mobx.dart';

part 'image_viewer_store.g.dart';

class ImageViewerStore = _ImageViewerBase with _$ImageViewerStore;

abstract class _ImageViewerBase with Store {
  _ImageViewerBase();

  @observable
  bool isLoading = false;

  @observable
  String? mediaURL;

  @action
  Future<void> setMedia(String url) async {
    mediaURL = url;
  }
}
