import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'app_config.dart';

late AppConfig appConfig;

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  appConfig = AppConfig(
      baseUrl: dotenv.env['BASE_URL'], apiKey: dotenv.env['API_KEY']);

  return runApp(
    ModularApp(module: AppModule(), child: const AppWidget()),
  );
}
