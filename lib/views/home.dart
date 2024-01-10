import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:maxwell/utils/globals.dart';
import 'package:maxwell/utils/methods.dart';
import 'package:maxwell/views/empty.dart';
import 'package:maxwell/views/lister.dart';
import 'package:maxwell/views/loading_screen.dart';
import 'package:maxwell/views/red_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Map<String, dynamic>>(
        future: load(),
        builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              final Map<String, dynamic> data = snapshot.data!;
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Lister(title: data.keys.elementAt(index), items: data.values.elementAt(index)))),
                  child: Container(
                    decoration: BoxDecoration(color: grey.withOpacity(.1), border: Border.all(color: grey, width: .5), borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(child: Text(data.keys.elementAt(index), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: pink))),
                        const SizedBox(width: 10),
                        const Icon(Bootstrap.chevron_right, size: 15, color: pink),
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) => Container(width: MediaQuery.sizeOf(context).width, height: .5, color: grey, margin: const EdgeInsets.symmetric(vertical: 8)),
                itemCount: data.length,
              );
            } else {
              return const Empty();
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else {
            return RedScreenOfDeath(error: snapshot.error.toString());
          }
        },
      ),
    );
  }
}
