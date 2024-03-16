import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/model/app_state_model.dart';
import 'package:store_pro/product_store/view/cart_view.dart';
import 'package:store_pro/product_store/view/icecream_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => AppStateModel(),
        child: const CartView()
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Ionicons.ice_cream_outline),
             label: 'Icecreams'
          ),
          NavigationDestination(
            icon: Icon(Ionicons.search_outline),
           label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Ionicons.cart_outline),
             label: 'Cart',
          ),
        ]
      ),
    );
  }
}