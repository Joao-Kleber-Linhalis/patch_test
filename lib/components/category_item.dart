import 'package:flutter/material.dart';
import 'package:patch_test/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage(category.image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(
                100,
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
    );
  }
}
