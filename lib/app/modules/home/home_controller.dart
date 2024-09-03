import 'package:flutter/material.dart';

import 'package:compra_facil/app/models/item_model.dart';
import 'package:compra_facil/app/modules/home/widgets/ajustes_page.dart';
import 'package:compra_facil/app/modules/home/widgets/compras_page.dart';
import 'package:compra_facil/app/modules/home/widgets/lista_page.dart';
// import 'package:compra_facil/app/repositories/item/item_repository.dart';

class HomeController extends ChangeNotifier {
  // final ItemRepository _repository;
  int index = 1;
  double total = 0.00;
  final items = <ItemModel>[];

  // HomeController(this._repository);

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

  sumAll() {
    total = ItemModel.sumAll(items);
    notifyListeners();
  }

  add(ItemModel model) {
    items.add(model);
    notifyListeners();
  }

  List<ItemModel> getAll() {
    return items;
  }
}
