import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/model/app_state_model.dart';
import 'package:store_pro/product_store/view/login_view.dart';
import 'package:store_pro/product_store/widgets/product_item.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../app/constants.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icecreams'),
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 6.0),
            width: 20,
            child: IconButton(
              icon: const Icon(Ionicons.log_out_outline), // You can replace 'Icons.logout' with your desired logout icon
              onPressed: () {
                Constants.prefs!.setBool("isLoggedIn", false);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView()
                  ),
                  (route) => false
                );
              },
            ),
          ),
          const VxDarkModeButton(
            showSelectedIcon: true,
            showSingleIcon: true,
          ).p16()
        ],
      ),
      body: Consumer<AppStateModel>(
        builder: (context, value, child) {
          final products = value.getproducts();
          return ListView.builder(
            itemBuilder: (context, index) {
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