import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:compra_facil/app/app_module.dart';
import 'package:compra_facil/app/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
