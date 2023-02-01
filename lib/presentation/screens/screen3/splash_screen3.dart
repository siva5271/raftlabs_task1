import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key, required this.text});
  final String text;

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
  @override
  void initState() {
    super.initState();
    fetchData(widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitRotatingCircle(
        color: Color.fromARGB(255, 28, 34, 116),
        size: 50.0,
      ),
    );
  }

  Future<void> fetchData(String text) async {
    final response = http
        .get(Uri.parse('https://api.publicapis.org/entries?category=$text'));
  }
}
