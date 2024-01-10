import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:maxwell/utils/globals.dart';
import 'package:maxwell/views/empty.dart';
import 'package:maxwell/views/item.dart';
import 'package:maxwell/views/viewer.dart';

class Lister extends StatelessWidget {
  const Lister({super.key, required this.title, required this.items});
  final String title;
  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Bootstrap.chevron_left, size: 15, color: pink)),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: pink)),
      ),
      body: items.isNotEmpty
          ? ListView.separated(
              padding: const EdgeInsets.all(16),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Viewer(expression: items[index]["expression"]))),
                child: Item(item: items[index]),
              ),
              separatorBuilder: (BuildContext context, int index) => Container(width: MediaQuery.sizeOf(context).width, height: .5, color: grey, margin: const EdgeInsets.symmetric(vertical: 8)),
              itemCount: items.length,
            )
          : const Empty(),
    );
  }
}
