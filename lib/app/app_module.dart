import 'package:flutter_modular/flutter_modular.dart';

import 'package:compra_facil/app/core/loader/loader.dart';
import 'package:compra_facil/app/core/theme/app_theme.dart';
import 'package:compra_facil/app/modules/home/home_module.dart';
import 'package:compra_facil/app/modules/splash/splash_module.dart';
import 'package:compra_facil/app/repositories/theme_repository/shared_preferences_theme.dart';
import 'package:compra_facil/app/repositories/theme_repository/theme_repository.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<ThemeRepository>(SharedPreferencesTheme.new);
    i.addSingleton(AppTheme.new);
    i.addSingleton(Loader.new);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: SplashModule());
    r.module('/home', module: HomeModule());
  }
}
