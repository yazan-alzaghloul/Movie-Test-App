import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_test_app/app/modules/image_viewer/image_viewer_module.dart';
import 'package:movie_test_app/app/shared/models/popular_people_model.dart';
import 'package:movie_test_app/app/shared/repositories/popular_repository.dart';

import 'modules/details/details_module.dart';
import 'modules/popular_people/popular_people_module.dart';
import 'modules/splash_screen/splash_screen_module.dart';
import 'shared/network/dio_factory.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => DioFactory().dio),
        Bind((i) => PopularRepository(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(SplashScreenModule.initialRoute,
            module: SplashScreenModule()),
        ModuleRoute(PopularPeopleModule.initialRoute,
            module: PopularPeopleModule()),
        ModuleRoute(DetailsModule.initialRoute, module: DetailsModule()),
        ModuleRoute(ImageViewerModule.initialRoute,
            module: ImageViewerModule()),
      ];
}
