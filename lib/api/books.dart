import 'dart:convert';
import 'package:ibr/ibr.dart';
import 'package:ibr/models/book.dart';

List<Book> parseBooks(String jsonStr) {
  final parsed = json.decode(jsonStr)["results"];
  List<Book> books =
      List<Book>.from(parsed.map((model) => Book.fromJson(model)));
  return books;
}

Future<List<Book>> getBooks(
    {int limit = 0, int categoryId, int publisherId}) async {
  String query = "?limit=$limit";
  if (categoryId != null) {
    query += "&category_id=$categoryId";
  } else if (publisherId != null) {
    query += "&publisher_id=$publisherId";
  }
  Response response =
      await get(Uri.parse(endpoint + "book/all" + query), headers: headers);

  if (response.statusCode == 200) {
    return parseBooks(response.body);
  } else {
    throw Exception('Error: statusCode= ${response.statusCode}');
  }
}
