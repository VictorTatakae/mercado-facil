import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:compra_facil/app/core/theme/app_theme.dart';

class AjustesPage extends StatefulWidget {
  const AjustesPage({super.key});

  @override
  State<AjustesPage> createState() => _AjustesPageState();
}

class _AjustesPageState extends State<AjustesPage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Modular.get<AppTheme>();
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  ' T E M A ',
                  style: textTheme.displayLarge,
                ),
                trailing: ElevatedButton.icon(
                  label: Icon(
                    appTheme.isDark ? Icons.dark_mode : Icons.light_mode,
                    color: appTheme.isDark ? Colors.deepPurple : Colors.deepPurple.shade400,
                  ),
                  onPressed: appTheme.toggle,
                ),
              ),
              const SizedBox(height: 15),
              ListTile(
                title: Text(
                  'C A C H E   T E M A',
                  style: textTheme.displayMedium,
                ),
                trailing: ElevatedButton.icon(
                  onPressed: appTheme.clear,
                  label: const Icon(Icons.delete, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
