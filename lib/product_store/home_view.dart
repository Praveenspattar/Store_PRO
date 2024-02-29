import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Store PRO')),
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