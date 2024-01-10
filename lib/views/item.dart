import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:latext/latext.dart';
import 'package:maxwell/utils/globals.dart';

class Item extends StatefulWidget {
  const Item({super.key, required this.item});
  final Map<String, dynamic> item;
  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool _isOpened = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                Flexible(child: LaTexT(laTeXCode: Text(widget.item["title"], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: pink)))),
                const SizedBox(height: 10),
                Flexible(child: LaTexT(laTeXCode: Text(r"\\alpha", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: white)))),
                if (!_isOpened)
                  ...AnimateList(
                    effects: <Effect>[const FadeEffect()],
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Flexible(child: LaTexT(laTeXCode: Text(widget.item["description"], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: white)))),
                    ],
                  ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          IconButton(onPressed: () => setState(() => _isOpened = !_isOpened), icon: Icon(_isOpened ? Bootstrap.chevron_down : Bootstrap.chevron_left, size: 15, color: pink)),
        ],
      ),
    );
  }
}
