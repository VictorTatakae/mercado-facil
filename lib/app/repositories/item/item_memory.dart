import 'package:compra_facil/app/models/item_model.dart';
import 'package:compra_facil/app/repositories/item/item_repository.dart';

class ItemMemory implements ItemRepository {
  final items = <ItemModel>[];

  @override
  addItem(ItemModel model) {
    items.add(model);
  }

  @override
  deleteItem(ItemModel model) {
    items.remove(model);
  }

  @override
  Future<List<ItemModel>> getAll() async {
    return items;
  }

  @override
  Future<ItemModel> getById(String id) async {
    return items.firstWhere((item) => item.id == id);
  }

  @override
  updateItem(ItemModel model) async {
    final index = items.indexOf(model);
    items[index] = model;
  }

  @override
  deleteAll() {
    items.clear();
  }
}
