import 'dart:convert';

import 'package:ibr/models/category.dart';

List<Category> parseCategories(String jsonStr) {
  final parsed = json.decode(jsonStr)["results"];
  List<Category> cats =
      List<Category>.from(parsed.map((model) => Category.fromJson(model)));
  return cats;
}
