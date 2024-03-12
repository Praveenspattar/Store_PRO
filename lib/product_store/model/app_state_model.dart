import 'package:flutter/material.dart';
import 'package:store_pro/product_store/data/product_repo.dart';
import 'package:store_pro/product_store/model/icecream.dart';


double _salesTaxRate = 0.18;
double _shippingCostPerItem = 10;

class AppStateModel extends ChangeNotifier {

  List<Icecream> _availableProducts = [];

  final _productsInCart = <int, int>{};

  Map<int,int> get productsInCart {
    return Map.from(_productsInCart);
  }

  // List<Product> get availableProducts {
  //   return List.from(_availableProducts);
  // }

  List<Icecream> getproducts() {
    return _availableProducts;
  }

  int get totalCartQuantity {
    return -productsInCart.values.fold(0, (sum, val) => sum + val);
  }

  double get subtotalCost {
    return _productsInCart.keys
      .map((id) => _availableProducts[id].price * _productsInCart[id]!)
      .fold(0, (sum, val) => sum + val);
  }

  double get shippingCost {
    return _shippingCostPerItem *
      _productsInCart.values.fold(0.0, (sum, val) => sum + val);
  }

  double get tax {
    return subtotalCost * _salesTaxRate;
  }

  double get totalCost {
    return subtotalCost + shippingCost + tax;
  }
  
  void addProductToCart(int productId){
    if(!_productsInCart.containsKey(productId)) {
      _productsInCart[productId] = 1;
    }else {
      _productsInCart[productId] = _productsInCart[productId]! + 1;
    }
    notifyListeners();
  }

  void removeItemFromCart(int productId) {
    if(_productsInCart.containsKey(productId)) {
      if (_productsInCart[productId] == 1) {
        _productsInCart.remove(productId);
      }else{
        _productsInCart[productId] = _productsInCart[productId]!;
      }
    }
    notifyListeners();
  }

  void clearCart() {
    _productsInCart.clear();
    notifyListeners();
  }

  List<Icecream> search(String query) {
    return _availableProducts
      .where(
        (product) =>
           product.flavor.toLowerCase().contains(query.toLowerCase()),
      )
      .toList();
  }

  Future<void> loadProducts() async{
    _availableProducts = await ProductRepo.loadAllIcecreams();
    notifyListeners();
  }

}