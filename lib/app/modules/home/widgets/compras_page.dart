import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:compra_facil/app/core/theme/app_theme.dart';
import 'package:compra_facil/app/modules/home/home_controller.dart';
import 'package:compra_facil/app/modules/home/widgets/add_item.dart';

class ComprasPage extends StatefulWidget {
  const ComprasPage({super.key});

  @override
  State<ComprasPage> createState() => _ComprasPageState();
}

class _ComprasPageState extends State<ComprasPage> {
  final appTheme = Modular.get<AppTheme>();

  final style = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Modular.get<HomeController>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
        child: Stack(
          children: [
            SelectionArea(
              child: AnimatedBuilder(
                  animation: controller,
                  builder: (_, __) {
                    return (controller.items.isNotEmpty)
                        ? ListView.separated(
                            itemCount: controller.items.length,
                            itemBuilder: (_, index) {
                              return InkWell(
                                onLongPress: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Confirmação'),
                                        content: const Text('Deseja apagar este produto?'),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () => Navigator.of(context).pop(),
                                            child: const Text(
                                              'Cancelar',
                                              style: TextStyle(color: Colors.red),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              controller.remove(controller.items[index]);
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Confirmar'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    color: appTheme.isDark ? Colors.black.withOpacity(.2) : Colors.deepPurple[300],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.items[index].name,
                                        style: textTheme.displaySmall,
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('${controller.items[index].quantity}x', style: style),
                                          Text('R\$${controller.items[index].price.toStringAsFixed(2)}', style: style),
                                          Text('R\$${controller.items[index].total().toStringAsFixed(2)}',
                                              style: style),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(height: 7),
                          )
                        : Center(
                            child: Text(
                              'Nenhum produto encontrado!',
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                    color: appTheme.isDark ? Colors.white : Colors.black,
                                  ),
                            ),
                          );
                  }),
            ),
            Positioned(
              right: 0,
              bottom: 15,
              child: ElevatedButton.icon(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.deepPurple),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  shape: WidgetStatePropertyAll(CircleBorder()),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AddItem();
                    },
                  );
                },
                label: const Icon(Icons.add),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                  color: appTheme.isDark ? Colors.deepPurple : Colors.cyanAccent.shade700,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AnimatedBuilder(
                      animation: controller,
                      builder: (_, __) {
                        return Text(
                          'R\$${controller.total}',
                          style: Theme.of(context).textTheme.displaySmall,
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
