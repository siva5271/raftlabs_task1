import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:raftlabs_task1/db/model/data_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({super.key, required this.finalList});
  final List<DataModel> finalList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListTileTheme(
          contentPadding: const EdgeInsets.all(15),
          textColor: Colors.black54,
          tileColor: const Color.fromARGB(255, 87, 72, 75),
          style: ListTileStyle.list,
          dense: true,
          child: ListView.separated(
              itemBuilder: ((context, index) => Card(
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      title: Center(
                        child: Text(
                          finalList[index].title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Center(
                          child: Text(
                        finalList[index].description,
                        style: const TextStyle(fontSize: 16),
                      )),
                    ),
                  )),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: finalList.length),
        ),
      ),
    );
  }
}
