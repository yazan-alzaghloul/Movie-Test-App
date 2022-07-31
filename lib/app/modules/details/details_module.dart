import 'package:flutter_modular/flutter_modular.dart';

import 'details_page.dart';
import 'details_store.dart';

class DetailsModule extends Module {
  static const initialRoute = '/details/';

  @override
  final List<Bind> binds = [Bind((i) => DetailsStore(i.get()))];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const DetailsPage())
  ];
}
