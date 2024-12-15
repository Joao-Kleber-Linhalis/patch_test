import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:patch_test/constants/constants.dart';
import 'package:patch_test/controllers/discover_controller.dart';
import 'package:patch_test/models/product.dart';
import 'package:http/http.dart' as http;

class ProductList with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items => [..._items];

  int get itemCount {
    return _items.length;
  }

  Future<void> loadProducts() async {
    final response = await http.get(Uri.parse(Constants.API_URL));
    if (response.body == 'null') return;

    List<dynamic> data = jsonDecode(response.body);
    _items.clear();

    for (var productData in data) {
      _items.add(
        Product.fromJson(productData),
      );
    }
    notifyListeners();
  }

  List<Product> filterProducts() {
    final category = DiscoverController.instance.selectedCategoryNotifier.value;
    final title = DiscoverController.instance.filterEditingController.text;
    List<Product> filteredProducts = _items;

    if (category.isNotEmpty) {
      filteredProducts = filteredProducts
          .where((product) => product.category == category)
          .toList();
    }

    if (title.isNotEmpty) {
      filteredProducts = filteredProducts
          .where((product) => product.title.contains(title))
          .toList();
    }

    return filteredProducts;
  }

  int filteredProductCount() {
    return filterProducts().length;
  }
}
