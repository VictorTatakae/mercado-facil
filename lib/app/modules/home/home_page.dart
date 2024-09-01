import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:compra_facil/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => controller.page(),
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.index,
              onDestinationSelected: controller.changeDestination,
              indicatorColor: Colors.deepPurple,
              destinations: const [
                NavigationDestination(icon: Icon(Icons.list), label: 'lista'),
                NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'compras'),
                NavigationDestination(icon: Icon(Icons.settings), label: 'ajustes'),
              ],
            );
          }),
    );
  }
}
