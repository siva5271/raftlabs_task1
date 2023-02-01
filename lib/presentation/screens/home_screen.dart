import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:raftlabs_task1/presentation/screens/screen1/screen1.dart';
import 'package:raftlabs_task1/presentation/screens/screen2/screen2.dart';

import '../widgets/custom_bottom_navigation_bar.dart';
import 'screen3/screen3.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = const [Screen1(), Screen2(), Screen3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: ((context, updatedIndex, child) => _pages[updatedIndex])),
    );
  }
}
