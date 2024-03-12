import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/model/app_state_model.dart';
import 'package:store_pro/product_store/widgets/product_item.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icecreams'),
      ),
      body: Consumer<AppStateModel>(
        builder: (context, value, child) {
          final products = value.getproducts();
          return ListView.builder(itemBuilder: (context, index) {
            print(products);
            return ProductItem(
              icecream: products[index],
            );
          },
          itemCount: products.length,
          );
        },
      ),
    );
  }
}