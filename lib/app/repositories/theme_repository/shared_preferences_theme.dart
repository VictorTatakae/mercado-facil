import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:compra_facil/app/core/consts/app_consts.dart';
import 'package:compra_facil/app/repositories/theme_repository/theme_repository.dart';

class SharedPreferencesTheme implements ThemeRepository {
  late final SharedPreferences _prefs;

  SharedPreferencesTheme() {
    init();
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<ThemeMode> getTheme() async {
    final index = _prefs.getInt(SETTINGS_KEY) ?? 1;
    return ThemeMode.values[index];
  }

  @override
  Future<void> setTheme(ThemeMode mode) async {
    await _prefs.setInt(SETTINGS_KEY, mode.index);
  }
}
