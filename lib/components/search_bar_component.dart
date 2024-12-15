import 'package:flutter/material.dart';
import 'package:patch_test/constants/constants.dart';

class SearchBarComponent extends StatelessWidget {
  const SearchBarComponent({
    super.key,
    required this.onChanged,
    required this.textEditingController,
  });
  final Function(String) onChanged;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (value) => onChanged(value),
      leading: const Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Icon(
          Icons.search,
          color: AppColors.searchBarColor,
          size: 24,
        ),
      ),
      controller: textEditingController,
      hintText: "What are you looking for?",
      textStyle: const WidgetStatePropertyAll(
        TextStyle(color: AppColors.searchBarColor),
      ),
    );
  }
}
