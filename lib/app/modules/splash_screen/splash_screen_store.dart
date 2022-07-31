import 'package:mobx/mobx.dart';

part 'splash_screen_store.g.dart';

class SplashScreenStore = _SplashScreenBase with _$SplashScreenStore;

abstract class _SplashScreenBase with Store {

  _SplashScreenBase();

  @observable
  bool isLoading = false;

}
