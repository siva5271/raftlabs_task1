import 'package:flutter/material.dart';
import 'package:raftlabs_task1/core/routes.dart';
import 'package:raftlabs_task1/presentation/screens/screen1/splash_screen1.dart';

import 'presentation/screens/home_screen.dart';
import 'presentation/screens/screen1/display_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        rHomeScreen: (context) => HomeScreen(),
        rDisplayScreen: (context) => const DisplayScreen(
              finalList: [],
            ),
        rSplashScreen1: (context) => const SplashScreen1()
      },
    );
  }
}
