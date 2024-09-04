import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:compra_facil/app/core/theme/app_theme.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Modular.get<AppTheme>();
    return Center(
      child: Text(
        'Tela não implementada \nno momento...',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
          color: appTheme.isDark ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
