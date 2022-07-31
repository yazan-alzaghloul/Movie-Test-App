import 'package:flutter_modular/flutter_modular.dart';

import 'image_viewer_page.dart';
import 'image_viewer_store.dart';

class ImageViewerModule extends Module {
  static const initialRoute = '/image_viewer';

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ImageViewerStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const ImageViewerPage()),
  ];
}
