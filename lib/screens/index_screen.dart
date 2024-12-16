import 'package:flutter/material.dart';
import 'package:patch_test/constants/constants.dart';
import 'package:patch_test/controllers/index_controller.dart';
import 'package:patch_test/screens/cart_screen.dart';
import 'package:patch_test/screens/discover_screen.dart';
import 'package:patch_test/screens/inbox_screen.dart';
import 'package:patch_test/screens/profile_screen.dart';
import 'package:patch_test/screens/sell_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final _widgetOptions = const <Widget>[
    DiscoverScreen(),
    CartScreen(),
    SellScreen(),
    InboxScreen(),
    ProfileScreen(),
  ];

  final screenController = IndexController.instance;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: screenController.selectedIndexNotifier,
      builder: (context, selectedIndex, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: Center(
            child: _widgetOptions.elementAt(selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Discover',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline_sharp),
                label: 'Sell',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inbox_outlined),
                label: 'Inbox',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'Profile',
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: AppColors.selectIndex,
            unselectedItemColor: AppColors.textColor,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            onTap: screenController.onItemTapped,
          ),
        );
      },
    );
  }
}
