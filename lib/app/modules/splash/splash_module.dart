import 'package:flutter_modular/flutter_modular.dart';

import 'package:compra_facil/app/modules/splash/splash_controller.dart';
import 'package:compra_facil/app/modules/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(SplashController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SplashPage());
  }
}
