import 'package:flutter/material.dart';
import 'package:patch_test/components/product_grid_item_component.dart';
import 'package:patch_test/models/product_list.dart';
import 'package:provider/provider.dart';

class ProductGridComponent extends StatelessWidget {
  const ProductGridComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Expanded(
      child: SingleChildScrollView(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: provider.filteredProductCount(),
          itemBuilder: (context, index) {
            return ProductGridItemComponent(
              product: provider.filterProducts()[index],
            );
          },
        ),
      ),
    );
  }
}
