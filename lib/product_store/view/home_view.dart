import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/model/app_state_model.dart';
import 'package:store_pro/product_store/view/icecream_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => AppStateModel(),
        child: const IcecreamView()
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.icecream),
             label: 'Icecreams'
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
           label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
             label: 'Cart',
          ),
        ]
      ),
    );
  }
}