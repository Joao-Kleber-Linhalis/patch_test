import 'package:flutter/material.dart';
import 'package:patch_test/components/category_component.dart';
import 'package:patch_test/components/search_bar_component.dart';
import 'package:patch_test/screens/models_screens/screen_model.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends ScreenModel<DiscoverScreen> {
  _DiscoverScreenState();
  TextEditingController textEditingController = TextEditingController();

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
              textEditingController: textEditingController,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget infoComponent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 46),
          const Text(
            "Choose from any category",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(height: 20),
          CategoryComponent(),
        ],
      ),
    );
  }
}
