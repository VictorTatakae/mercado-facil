import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:compra_facil/app/models/item_model.dart';
import 'package:compra_facil/app/modules/home/home_controller.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final controller = Modular.get<HomeController>();
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final quantityEC = TextEditingController();
  final priceEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    quantityEC.dispose();
    priceEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey.shade900,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
        child: Form(
          key: formKey,
          child: SizedBox(
            width: double.infinity,
            height: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Novo Produto',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 30),
                ),
                TextFormField(
                  // focusNode: focusNode,
                  controller: nameEC,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),
                  decoration: const InputDecoration(
                    isDense: true,
                    hintText: 'Nome do produto',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    // handleNext();
                    // focusNode.requestFocus();
                  },
                  validator: (nome) {
                    if (nome == null || nome.isEmpty) {
                      return 'Campo obrigatório!';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  // focusNode: focusNode,
                  controller: quantityEC,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),
                  decoration: const InputDecoration(
                    isDense: true,
                    hintText: 'Quantidade',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    // handleNext();
                    // focusNode.requestFocus();
                  },
                  validator: (qtd) {
                    if (qtd == null || qtd.isEmpty) {
                      return 'Campo obrigatório!';
                    }
                    int? n = int.tryParse(qtd);

                    return n == null ? 'Este campo só recebe inteiro' : null;
                  },
                ),
                TextFormField(
                  // focusNode: focusNode,
                  controller: priceEC,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),
                  decoration: const InputDecoration(
                    isDense: true,
                    hintText: 'Preço',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    // handleNext();
                    // focusNode.requestFocus();
                  },
                  validator: (price) {
                    if (price == null || price.isEmpty) {
                      return 'Campo obrigatório!';
                    }
                    double? n = double.tryParse(price);

                    return n == null ? 'Este campo só recebe double' : null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      final price = double.parse(priceEC.text).toStringAsFixed(2);
                      final model = ItemModel(
                        name: nameEC.text.trim(),
                        price: double.parse(price),
                        quantity: int.parse(quantityEC.text.trim()),
                      );
                      controller.add(model);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Adicionar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
