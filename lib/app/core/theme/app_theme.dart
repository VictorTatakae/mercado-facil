import 'package:flutter/material.dart';

import 'package:compra_facil/app/repositories/theme_repository/theme_repository.dart';

class AppTheme extends ValueNotifier<ThemeMode> {
  final ThemeRepository _repository;

  AppTheme(this._repository) : super(ThemeMode.light) {
    loadMode();
  }

  bool get isDark => value == ThemeMode.dark;

  final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
  );

  final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
  );

  void loadMode() async {
    value = await _repository.getTheme();
  }

  void toggle() async {
    value = isDark ? ThemeMode.light : ThemeMode.dark;
    await _repository.setTheme(value);
  }
}
