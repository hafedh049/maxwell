import 'package:flutter/material.dart';
import 'package:maxwell/utils/methods.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<Map<String,dynamic>>(
          future: loadSubjects(),
          builder: (context, snapshot) {
            return ListView.separated(itemBuilder: (context, index) => , separatorBuilder: (context, index) => , itemCount: itemCount,);
          }
        ),
      ),
    );
  }
}
