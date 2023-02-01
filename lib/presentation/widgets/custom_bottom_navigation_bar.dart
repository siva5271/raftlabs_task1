import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/colors.dart';
import '../screens/home_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HomeScreen.selectedIndexNotifier,
      builder: (context, updatedIndex, child) {
        return BottomNavigationBar(
            backgroundColor: cAppBarColor,
            selectedItemColor: cScaffoldBackgroundColor,
            unselectedItemColor: Colors.white,
            currentIndex: updatedIndex,
            onTap: (newIndex) {
              HomeScreen.selectedIndexNotifier.value = newIndex;
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'Screen 1'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_time), label: 'Screen 2 '),
              BottomNavigationBarItem(icon: Icon(Icons.web), label: 'Screen 3')
            ]);
      },
    );
  }
}
