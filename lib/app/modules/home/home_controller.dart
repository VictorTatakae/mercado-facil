import 'package:flutter/material.dart';

import 'package:compra_facil/app/models/item_model.dart';
import 'package:compra_facil/app/modules/home/widgets/ajustes_page.dart';
import 'package:compra_facil/app/modules/home/widgets/compras_page.dart';
import 'package:compra_facil/app/modules/home/widgets/lista_page.dart';
import 'package:compra_facil/app/repositories/item/item_repository.dart';
// import 'package:compra_facil/app/repositories/item/item_repository.dart';

class HomeController extends ChangeNotifier {
  final ItemRepository _repository;
  int index = 1;
  double total = 0.00;
  var items = <ItemModel>[];

  HomeController(this._repository) {
    getItems();
  }

  getItems() async {
    items = await _repository.getAll();
    sumAll();
    notifyListeners();
  }

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
    var sum = 0.0;
    for (var item in items) {
      sum += item.total();
    }
    total = double.parse(sum.toStringAsFixed(2));
    notifyListeners();
  }

  add(ItemModel model) async {
    await _repository.addItem(model);
    getItems();
    notifyListeners();
  }

  remove(ItemModel model) async {
    await _repository.deleteItem(model);
    getItems();
    notifyListeners();
  }

  removeAll() async {
    await _repository.deleteAll();
    getItems();
    notifyListeners();
  }
}
