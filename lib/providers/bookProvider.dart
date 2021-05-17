import 'package:ibr/ibr.dart';
import 'package:ibr/models/book.dart';

class BookProvider extends ChangeNotifier {
  List<Book> books;
  Future<List<Book>> getAllBooks() async {
    books = await getBooks(limit: 0);
    return books;
  }

  setBooks(List<Book> newBooks) {
    books = newBooks;
    notifyListeners();
  }
}
