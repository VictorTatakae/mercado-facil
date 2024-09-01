import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:compra_facil/app/core/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>((appTheme) => appTheme);
    return MaterialApp.router(
      title: 'Compra fácil',
      debugShowCheckedModeBanner: false,
      themeMode: appTheme.value,
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      routerConfig: Modular.routerConfig,
    );
  }
}
