import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:compra_facil/app/core/loader/loader.dart';
import 'package:compra_facil/app/core/theme/app_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
