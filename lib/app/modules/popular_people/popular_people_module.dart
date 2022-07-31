import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_test_app/app/modules/popular_people/popular_people_page.dart';
import 'package:movie_test_app/app/modules/popular_people/popular_people_store.dart';

class PopularPeopleModule extends Module {
  static const initialRoute = '/popular_people/';

  @override
  final List<Bind> binds = [Bind((i) => PopularPeopleStore(i.get()))];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const PopularPeoplePage())
  ];
}
