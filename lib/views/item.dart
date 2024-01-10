import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:icons_plus/icons_plus.dart';
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
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(child: Text(widget.item["title"], style: const TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500))),
                const SizedBox(height: 10),
                Flexible(child: Math.tex(widget.item["expression"], textStyle: const TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500))),
                if (_isOpened) ...<Widget>[
                  const SizedBox(height: 10),
                  Flexible(child: Text(widget.item["description"], style: const TextStyle(fontSize: 12, color: white, fontWeight: FontWeight.w500))),
                ],
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
