// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:raftlabs_task1/core/routes.dart';
import 'package:raftlabs_task1/db/model/data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:raftlabs_task1/presentation/screens/screen1/display_screen.dart';

List<DataModel> finalList = [];

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  final String _url = "https://api.publicapis.org/entries";
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(_url));
    final rawData = jsonDecode(response.body);
    final entries = rawData['entries'];
    for (var entry in entries) {
      finalList.add(DataModel(
          title: entry['API'].toString(),
          description: entry['Description'].toString()));
    }
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => DisplayScreen(finalList: finalList)));
  }
}
