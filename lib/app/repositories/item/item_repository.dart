import 'package:compra_facil/app/models/item_model.dart';

abstract interface class ItemRepository {
  Future<List<ItemModel>> getAll();
  Future<ItemModel> getById(String id);
  addItem(ItemModel model);
  updateItem(ItemModel model);
  deleteItem(ItemModel model);
  deleteAll();
}
