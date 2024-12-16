import 'package:flutter/material.dart';

class DiscoverController {
  static DiscoverController? _instance;

  static DiscoverController get instance {
    _instance ??= DiscoverController._();
    return _instance!;
  }

  DiscoverController._() {
    debugPrint("==== DiscoverController =====");
    filterEditingController.addListener(_onFilterChanged);
  }

  ValueNotifier<String> selectedCategoryNotifier = ValueNotifier<String>("");
  TextEditingController filterEditingController = TextEditingController();
  ValueNotifier<String> searchQueryNotifier = ValueNotifier<String>("");
  String priceOrder = '';

  void _onFilterChanged() {
    searchQueryNotifier.value = filterEditingController.text;
  }

  void onItemTapped(String category) {
    print(category);
    if (selectedCategoryNotifier.value == category) {
      selectedCategoryNotifier.value = "";
    } else {
      selectedCategoryNotifier.value = category;
    }
    print(selectedCategoryNotifier.value);
  }
}
