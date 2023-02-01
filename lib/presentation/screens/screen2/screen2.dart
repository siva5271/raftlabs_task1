// ignore_for_file: unused_field

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:raftlabs_task1/core/colors.dart';

ValueNotifier<bool> isConnected = ValueNotifier(false);

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void initState() {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(getTitle()),
          backgroundColor: cAppBarColor,
          centerTitle: true,
        ),
        body: Center(
            child: _connectionStatus == ConnectivityResult.none
                ? const Text(
                    'No Internet Connection!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )
                : const Text(
                    'Device connected to the internet!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )));
  }

  String getTitle() {
    final currentTime = int.parse(DateFormat('kk').format(DateTime.now()));
    if (currentTime > 4 && currentTime < 12) {
      return 'Good Morning!';
    } else if (currentTime < 16) {
      return 'Good Afternoon!';
    } else if (currentTime < 19) {
      return 'Good Evening';
    } else {
      return 'Good night';
    }
  }
}
