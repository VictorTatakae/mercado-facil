import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:compra_facil/app/core/consts/app_consts.dart';
import 'package:compra_facil/app/models/item_model.dart';
import 'package:compra_facil/app/repositories/item/item_repository.dart';

class ItemSharedPreferences implements ItemRepository {
  @override
  addItem(ItemModel model) async {
    final prefs = await SharedPreferences.getInstance();
    final items = await getAll();
    items.add(model);
    final itemsStringList = items.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList(ITEMS_KEY, itemsStringList);
  }

  @override
  deleteItem(ItemModel model) async {
    final prefs = await SharedPreferences.getInstance();
    final items = await getAll();
    items.remove(model);
    final itemsStringList = items.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList(ITEMS_KEY, itemsStringList);
  }

  @override
  Future<List<ItemModel>> getAll() async {
    final prefs = await SharedPreferences.getInstance();
    final stringItemList = prefs.getStringList(ITEMS_KEY);

    if (stringItemList != null) {
      return stringItemList.map((e) => ItemModel.fromJson(json.decode(e))).toList();
    }
    return [];
  }

  @override
  Future<ItemModel> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  updateItem(ItemModel model) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  @override
  deleteAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(ITEMS_KEY);
  }
}
