import 'package:flutter/material.dart';

import 'package:compra_facil/app/models/item_model.dart';
import 'package:compra_facil/app/repositories/item/item_repository.dart';

class SplashController extends ChangeNotifier {
  final ItemRepository _repository;

  SplashController(this._repository);

  Future<List<ItemModel>> loadItems() async {
    return await _repository.getAll();
  }
}
