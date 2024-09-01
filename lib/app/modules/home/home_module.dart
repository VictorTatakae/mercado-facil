import 'package:flutter_modular/flutter_modular.dart';

import 'package:compra_facil/app/modules/home/home_controller.dart';
import 'package:compra_facil/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }
}
