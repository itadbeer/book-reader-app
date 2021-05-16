import 'package:ibr/api/category.dart';
import 'package:ibr/models/book.dart';
import 'package:ibr/models/category.dart';
import 'package:test/test.dart';
import 'package:ibr/api/books.dart';

void main() {
  test("get books from api", () async {
    List<Book> books = await getBooks();
    expect(books.first.id, 1);
  });

  test("get categories from api", () async {
    List<Category> categories = await getAllCategories();
    expect(categories.first.id, 1);
  });
}
