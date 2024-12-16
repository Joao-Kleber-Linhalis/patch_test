import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:patch_test/constants/constants.dart';
import 'package:patch_test/controllers/discover_controller.dart';
import 'package:patch_test/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:diacritic/diacritic.dart';

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
    final orderPrice = DiscoverController.instance.priceOrder;
    List<Product> filteredProducts = _items;

    // filter by category
    if (category.isNotEmpty) {
      filteredProducts = filteredProducts
          .where((product) => product.category == category)
          .toList();
    }

    // filter by title
    if (title.isNotEmpty) {
      final normalizedTitle = removeDiacritics(title.toLowerCase().trim());

      filteredProducts = filteredProducts.where((product) {
        final normalizedProductTitle =
            removeDiacritics(product.title.toLowerCase());
        return normalizedProductTitle.contains(normalizedTitle);
      }).toList();
    }

    // order by price
    if (orderPrice.isNotEmpty) {
      if (orderPrice == 'lowest') {
        filteredProducts.sort((a, b) => a.price.compareTo(b.price));
      } else if (orderPrice == 'highest') {
        filteredProducts.sort((a, b) => b.price.compareTo(a.price));
      }
    }

    return filteredProducts;
  }

  int filteredProductCount() {
    return filterProducts().length;
  }
}
