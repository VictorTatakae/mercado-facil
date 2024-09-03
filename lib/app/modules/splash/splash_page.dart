import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:compra_facil/app/core/theme/app_theme.dart';
import 'package:compra_facil/app/modules/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = Modular.get<SplashController>();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    // final items = await controller.loadItems();
    Modular.to.navigate('/home/');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Modular.get<AppTheme>().isDark;
    return Scaffold(
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: isDark ? null : Colors.black.withOpacity(.65),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: LoadingAnimationWidget.bouncingBall(
              color: Colors.white,
              size: 75,
            ),
          ),
        ),
      ),
    );
  }
}
