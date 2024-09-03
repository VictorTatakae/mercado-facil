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
    scaffoldBackgroundColor: const Color(0xFFf5f4f4),
    listTileTheme: ListTileThemeData(
      tileColor: Colors.deepPurple.shade400,
    ),
    navigationBarTheme: NavigationBarThemeData(iconTheme: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(
            color: Colors.deepPurple.shade100,
          );
        }
        return null;
      },
    )),
    iconTheme: IconThemeData(
      color: Colors.purpleAccent.shade700,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );

  final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    listTileTheme: ListTileThemeData(
      tileColor: Colors.black.withOpacity(.15),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );

  loadMode() async {
    value = await _repository.getTheme();
  }

  toggle() async {
    value = isDark ? ThemeMode.light : ThemeMode.dark;
    await _repository.setTheme(value);
  }

  clear() async {
    await _repository.clear();
    loadMode();
  }
}
