import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:maxwell/utils/globals.dart';
import 'package:maxwell/views/empty.dart';
import 'package:maxwell/views/viewer.dart';

class Lister extends StatelessWidget {
  const Lister({super.key, required this.title, required this.items});
  final String title;
  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SliverAppBar(
            centerTitle: true,
            leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Bootstrap.chevron_left, size: 15, color: pink)),
            title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: pink)),
          ),
          const SizedBox(height: 10),
          if (items.isNotEmpty)
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Viewer(expression: items[index]["expression"]))),
                      child: Container(
                        decoration: BoxDecoration(color: grey.withOpacity(.1), border: Border.all(color: grey, width: .5), borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Flexible(child: Text(items[index], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: pink))),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Bootstrap.chevron_right, size: 15, color: pink),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                separatorBuilder: (BuildContext context, int index) => Container(width: MediaQuery.sizeOf(context).width, height: .5, color: grey, margin: const EdgeInsets.symmetric(vertical: 8)),
                itemCount: items.length,
              ),
            )
          else
            const Empty(),
        ],
      ),
    );
  }
}
