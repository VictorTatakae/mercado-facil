import 'package:flutter/material.dart';

abstract interface class ThemeRepository {
  Future<ThemeMode> getTheme();
  setTheme(ThemeMode mode);
  clear();
}
