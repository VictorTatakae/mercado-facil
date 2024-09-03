import 'package:flutter/material.dart';

import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:compra_facil/app/core/theme/app_theme.dart';
import 'package:compra_facil/app/models/item_model.dart';
import 'package:compra_facil/app/modules/home/home_controller.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final controller = Modular.get<HomeController>();
  final appTheme = Modular.get<AppTheme>();
  final formKey = GlobalKey<FormState>();

  // Controllers
  final nameEC = TextEditingController();
  final quantityEC = TextEditingController();
  final priceEC = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    decimalSeparator: ',',
    thousandSeparator: '.',
  );

  // focus nodes
  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();
  final _focusNode3 = FocusNode();

  // SubmitAcion
  submit(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      String priceString = priceEC.text.replaceAll('.', '').replaceAll(',', '.').replaceAll('R\$ ', '');
      final price = double.parse(priceString).toStringAsFixed(2);
      final model = ItemModel(
        name: nameEC.text.trim(),
        price: double.parse(price),
        quantity: int.parse(quantityEC.text.trim()),
      );
      controller.add(model);
      controller.sumAll();
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    nameEC.dispose();
    quantityEC.dispose();
    priceEC.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey.shade900,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Form(
          key: formKey,
          child: SizedBox(
            width: double.infinity,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Novo Produto',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 30),
                ),
                TextFormField(
                  focusNode: _focusNode1,
                  autofocus: true,
                  controller: nameEC,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_focusNode2);
                  },
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
                  validator: (nome) {
                    if (nome == null || nome.isEmpty) {
                      return 'Campo obrigatório!';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  focusNode: _focusNode2,
                  controller: quantityEC,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_focusNode3);
                  },
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
                  validator: (qtd) {
                    if (qtd == null || qtd.isEmpty) {
                      return 'Campo obrigatório!';
                    }
                    int? n = int.tryParse(qtd);

                    return n == null ? 'Este campo só recebe inteiro' : null;
                  },
                ),
                TextFormField(
                  focusNode: _focusNode3,
                  controller: priceEC,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    submit(context);
                  },
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
                  validator: (price) {
                    if (price == null || price.isEmpty) {
                      return 'Campo obrigatório!';
                    }
                    String priceString = price.replaceAll('.', '').replaceAll(',', '.').replaceAll('R\$ ', '');
                    double? n = double.tryParse(priceString);

                    return n == null ? 'Este campo só recebe double' : null;
                  },
                ),
                ElevatedButton(
                  onPressed: () => submit(context),
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(appTheme.isDark ? Colors.deepPurple : Colors.deepPurple.shade400),
                    foregroundColor: const WidgetStatePropertyAll(Colors.white),
                  ),
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
