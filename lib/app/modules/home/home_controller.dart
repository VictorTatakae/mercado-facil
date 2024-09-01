import 'package:flutter/material.dart';

import 'package:compra_facil/app/modules/home/widgets/ajustes_page.dart';
import 'package:compra_facil/app/modules/home/widgets/compras_page.dart';
import 'package:compra_facil/app/modules/home/widgets/lista_page.dart';

class HomeController extends ChangeNotifier {
  int index = 2;

  changeDestination(int value) {
    index = value;
    notifyListeners();
  }

  Widget page() {
    switch (index) {
      case 0:
        return const ListaPage();
      case 1:
        return const ComprasPage();
      case 2:
        return const AjustesPage();
      default:
        return const SizedBox.shrink();
    }
  }
}
