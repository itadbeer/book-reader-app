import 'package:ibr/ibr.dart';
import 'package:ibr/models/category.dart';

List<Category> parseCategories(String jsonStr) {
  final parsed = json.decode(jsonStr)["results"];
  List<Category> cats =
      List<Category>.from(parsed.map((model) => Category.fromJson(model)));
  return cats;
}

getCategory(BuildContext context, {int categoryId}) {
  final categories = Provider.of<List<Category>>(context);
  return categories
      .firstWhere((Category category) => category.id == categoryId);
}

List<Category> searchCategory(BuildContext context, {String categoryName}) {
  final categories = Provider.of<List<Category>>(context);
  return categories
      .where((Category category) => category.name.contains(categoryName))
      .toList();
}

Future<List<Category>> getAllCategories({int limit = 0}) async {
  Response response = await get(
      Uri.parse(endpoint + "category/all?limit=$limit"),
      headers: headers);

  if (response.statusCode == 200) {
    return parseCategories(response.body);
  } else {
    throw Exception('Error: statusCode= ${response.statusCode}');
  }
}
