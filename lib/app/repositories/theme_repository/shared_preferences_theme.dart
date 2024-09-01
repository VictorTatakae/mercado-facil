import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:compra_facil/app/core/consts/app_consts.dart';
import 'package:compra_facil/app/repositories/theme_repository/theme_repository.dart';

class SharedPreferencesTheme implements ThemeRepository {

  SharedPreferencesTheme();

  @override
  Future<ThemeMode> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(SETTINGS_KEY) ?? 1;
    return ThemeMode.values[index];
  }

  @override
  Future<void> setTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(SETTINGS_KEY, mode.index);
  }
}
