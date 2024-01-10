import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map<String, dynamic>> load() async {
  try {
    return json.decode(await rootBundle.loadString("assets/jsons/latex.json"));
  } catch (e) {
    return <String, dynamic>{};
  }
}
