import 'dart:convert';
import 'package:ibr/ibr.dart';
import 'package:ibr/models/category.dart';

List<Category> parseCategories(String jsonStr) {
  final parsed = json.decode(jsonStr)["results"];
  List<Category> cats =
      List<Category>.from(parsed.map((model) => Category.fromJson(model)));
  return cats;
}

Future<List<Category>> getCategories({int limit = 0}) async {
  Response response = await get(
      Uri.parse(endpoint + "category/all?limit=$limit"),
      headers: headers);

  if (response.statusCode == 200) {
    return parseCategories(response.body);
  } else {
    throw Exception('Error: statusCode= ${response.statusCode}');
  }
}
