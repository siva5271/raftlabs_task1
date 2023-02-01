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

class SplashScreen1SpecificAPI extends StatefulWidget {
  const SplashScreen1SpecificAPI({super.key, required this.query});
  final String query;
  @override
  State<SplashScreen1SpecificAPI> createState() =>
      _SplashScreen1SpecificAPIState();
}

class _SplashScreen1SpecificAPIState extends State<SplashScreen1SpecificAPI> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitRotatingCircle(
        color: Colors.blue,
        size: 50.0,
      ),
    );
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        "https://api.publicapis.org/entries?category=${widget.query}"));
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
