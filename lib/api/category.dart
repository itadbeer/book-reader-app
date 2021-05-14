import 'dart:convert';
import 'package:ibr/models/category.dart';

Category parseCategory(String jsonStr) {
  final parsed = json.decode(jsonStr);
  Category category = Category.fromJson(parsed);
  return category;
}
