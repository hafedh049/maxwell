import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:maxwell/utils/globals.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(width: MediaQuery.sizeOf(context).width * .6, child: Lottie.asset("assets/lotties/empty.json")),
            const Flexible(child: Text("There is nothing yet.", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500), textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }
}
