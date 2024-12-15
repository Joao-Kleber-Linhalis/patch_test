import 'package:flutter/material.dart';
import 'package:patch_test/controllers/discover_controller.dart';
import 'package:patch_test/models/category.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;
  final DiscoverController discoverController = DiscoverController.instance;

  @override
  Widget build(BuildContext context) {
    bool isSelected =
        category.value == discoverController.selectedCategoryNotifier.value;
    return GestureDetector(
      onTap: () {
        discoverController.onItemTapped(category.value);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Column(
          children: [
            Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                // Gradient border applied when the category is selected.
                gradient: isSelected
                    ? const LinearGradient(
                        colors: [Color(0xFF4CBACC), Color(0xFF77D28B)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                borderRadius: BorderRadius.circular(100),
              ),
              // Container to create spacing (gap) between the gradient border and the image.
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(category.image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              category.label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
