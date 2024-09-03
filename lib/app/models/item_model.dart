// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:compra_facil/app/helpers/id_generator.dart';

class ItemModel {
  late String id;
  String name;
  double price;
  int quantity;

  ItemModel({
    required this.name,
    required this.price,
    required this.quantity,
  }) : id = idGenerator();

  double total() => price * quantity;
  double price30() => price * 1.3;

  static double sumAll(List<ItemModel> items) {
    if (items.isEmpty) return 0.00;
    var value = items.map((item) => item.total()).reduce((value, element) => value + element).toStringAsFixed(2);
    return double.parse(value);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    final model = ItemModel(
      name: map['name'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
    );
    model.id = map['id'] as String;
    return model;
  }

  factory ItemModel.fromJson(String j) => ItemModel.fromMap(json.decode(j));

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.price == price && other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ price.hashCode ^ quantity.hashCode;
  }
}
