import 'package:flutter/material.dart';
import 'package:patch_test/constants/constants.dart';
import 'package:patch_test/models/product.dart';

class ProductGridItemComponent extends StatelessWidget {
  final Product product;

  const ProductGridItemComponent({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(color: AppColors.filterColor, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image
          Expanded(
            child: Hero(
              tag: product.id,
              child: FadeInImage(
                placeholder: const AssetImage(
                    "assets/placeholder/product_placeholder.png"),
                image: NetworkImage(product.image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Ttile and Price
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  "\$${product.description}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.descriptionColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
