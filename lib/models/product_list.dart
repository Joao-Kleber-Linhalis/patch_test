import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:patch_test/constants/constants.dart';
import 'package:patch_test/models/product.dart';
import 'package:http/http.dart' as http;

class ProductList with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items => [..._items];

  ProductList([
    this._items = const [],
  ]);

  int get itemCount {
    return _items.length;
  }

  Future<void> loadProducts() async {
    _items.clear();
    final response = await http.get(Uri.parse(Constants.API_URL));
    if (response.body == 'null') return;

    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach(
      (_, productData) {
        _items.add(
          Product.fromJson(productData),
        );
      },
    );
    notifyListeners();
  }
}
