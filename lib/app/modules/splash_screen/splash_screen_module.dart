

import 'package:flutter_modular/flutter_modular.dart';

import 'splash_screen_page.dart';
import 'splash_screen_store.dart';

class SplashScreenModule extends Module {
  static const initialRoute = '/';

  @override
  final List<Bind> binds = [Bind((i) => SplashScreenStore())];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const SplashScreenPage())
  ];
}
