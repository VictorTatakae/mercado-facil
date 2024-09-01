import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:compra_facil/app/core/theme/app_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>((appTheme) => appTheme);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Splash Page'),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () => appTheme.toggle(),
              label: Icon(appTheme.isDark ? Icons.dark_mode : Icons.light_mode),
            )
          ],
        ),
      ),
    );
  }
}
