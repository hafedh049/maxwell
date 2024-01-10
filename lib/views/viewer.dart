import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:maxwell/utils/globals.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Viewer extends StatefulWidget {
  const Viewer({super.key, required this.expression});
  final String expression;
  @override
  State<Viewer> createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
  late final WebViewController _controller;
  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(transparent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Bootstrap.chevron_left, size: 15, color: pink)),
        title: const Text("Viewer", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: pink)),
      ),
      body: WebViewWidget(controller: _controller..loadRequest(Uri.parse('https://flutter.dev'))),
    );
  }
}
