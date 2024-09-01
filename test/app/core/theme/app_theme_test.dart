import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'should return index of the ThemeMode',
    () {
      debugPrint(ThemeMode.system.index.toString());
      debugPrint(ThemeMode.light.index.toString());
      debugPrint(ThemeMode.dark.index.toString());
      debugPrint(ThemeMode.values[0].toString());
      expect(ThemeMode.system.index, 0);
      expect(ThemeMode.light.index, 1);
      expect(ThemeMode.dark.index, 2);
    },
  );
}
