import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:store_pro/product_store/model/icecream.dart';

class ProductRepo {

  static Future<List<Icecream>> loadAllIcecreams()async {
    final res = await rootBundle.loadString("assets/icecreams.json");
    final iceCreamData = IcecreamData.fromJson(jsonDecode(res) as Map<String, dynamic>);

    return iceCreamData.icecreams!;
  }

}