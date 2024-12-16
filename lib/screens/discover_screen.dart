import 'package:flutter/material.dart';
import 'package:patch_test/components/category_component.dart';
import 'package:patch_test/components/product_grid_component.dart';
import 'package:patch_test/components/search_bar_component.dart';
import 'package:patch_test/constants/constants.dart';
import 'package:patch_test/controllers/discover_controller.dart';
import 'package:patch_test/models/product_list.dart';
import 'package:patch_test/screens/models_screens/screen_model.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends ScreenModel<DiscoverScreen> {
  _DiscoverScreenState();

  final DiscoverController discoverController = DiscoverController.instance;
  bool _isLoading = true;
  late ProductList provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<ProductList>(context, listen: false);
    provider.loadProducts().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget headerComponent() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        super.headerComponent(),
        Positioned(
          bottom: -25,
          left: 16,
          right: 16,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SearchBarComponent(
              onChanged: (p0) {},
              textEditingController: discoverController.filterEditingController,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget infoComponent() {
    return _isLoading
        ? const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ValueListenableBuilder(
                valueListenable: discoverController.selectedCategoryNotifier,
                builder: (context, value, child) {
                  return ValueListenableBuilder<String>(
                    valueListenable: discoverController.searchQueryNotifier,
                    builder: (context, searchQuery, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 46),
                          const Text(
                            "Choose from any category",
                            textAlign: TextAlign.start,
                            style: TextStyles.w600,
                          ),
                          CategoryComponent(),
                          const SizedBox(height: 5),
                          Text(
                            "${provider.filteredProductCount()} products to choose from",
                            textAlign: TextAlign.start,
                            style: TextStyles.w600,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              filterButton(label: "Lowest"),
                              const SizedBox(width: 15),
                              filterButton(label: "Highest"),
                            ],
                          ),
                          // ignore: prefer_const_constructors
                          ProductGridComponent(), // Do not use `const` here, as the widget needs to be rebuilt when the listener's value changes.
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          );
  }

  Widget filterButton({required String label}) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          discoverController.priceOrder = label.toLowerCase();
        });
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(136, 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        backgroundColor: discoverController.priceOrder == label.toLowerCase()
            ? AppColors.primaryColor
            : AppColors.filterColor,
      ),
      child: Text(
        "$label price first",
        style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor),
      ),
    );
  }
}
