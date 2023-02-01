import 'package:flutter/material.dart';

import 'package:raftlabs_task1/core/routes.dart';
import 'package:raftlabs_task1/presentation/screens/screen1/splash_screen1_specific_api.dart';

import '../../../core/constants.dart';

TextEditingController _textEditingController = TextEditingController();

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, rSplashScreen1),
          child: const Text('Fetch API')),
      Column(
        children: [
          TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter the search value')),
          ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SplashScreen1SpecificAPI(
                            query: _textEditingController.text,
                          ))),
              child: const Text('Fetch the specified API')),
        ],
      )
    ]);
  }
}
