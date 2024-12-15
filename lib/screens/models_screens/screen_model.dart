import 'package:flutter/material.dart';
import 'package:patch_test/constants/constants.dart';

// Default page model to reuse shared components, in this case, the header.
abstract class ScreenModel<T extends StatefulWidget> extends State<T> {
  Widget infoComponent() {
    return const Expanded(
      child: Center(
        child: Text("Imagine a very beautiful design here"),
      ),
    );
  }

  Widget headerComponent() {
    return Container(
      color: AppColors.primaryColor,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.13,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          headerComponent(),
          infoComponent(),
        ],
      ),
    );
  }
}
