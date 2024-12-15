import 'package:flutter/material.dart';
import 'package:patch_test/components/category_item.dart';
import 'package:patch_test/models/category.dart';

class CategoryComponent extends StatelessWidget {
  CategoryComponent({super.key});

  final List<Category> categorys = Category.categoryList; //Mocked

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        itemCount: categorys.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(category: categorys[index]);
        },
      ),
    );
  }
}
