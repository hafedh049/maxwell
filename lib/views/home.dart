import 'package:flutter/material.dart';
import 'package:maxwell/utils/globals.dart';
import 'package:maxwell/utils/methods.dart';
import 'package:maxwell/views/empty.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<Map<String, dynamic>>(
            future: load(),
            builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  final Map<String, dynamic> data = snapshot.data!;
                  return ListView.separated(
                    itemBuilder: (BuildContext context, int index) => Container(
                      decoration: BoxDecoration(
                        color: grey.withOpacity(.1),
                        border: Border.all(color: grey, width: .5),
                        borderRadius: BorderRadius.circular(15),
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
            }),
      ),
    );
  }
}
