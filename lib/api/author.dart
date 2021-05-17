import 'package:ibr/ibr.dart';
import 'package:ibr/models/author.dart';

List<Author> parseAuthors(String jsonStr) {
  final parsed = json.decode(jsonStr)["results"];
  List<Author> authors =
      List<Author>.from(parsed.map((model) => Author.fromJson(model)));
  return authors;
}

getAuthor(BuildContext context, {int authorId}) {
  final authors = Provider.of<List<Author>>(context);
  return authors.firstWhere((Author author) => author.id == authorId);
}

List<Author> searchAuthor(BuildContext context, {String authorName}) {
  final authors = Provider.of<List<Author>>(context);
  return authors
      .where((Author author) => author.name.contains(authorName))
      .toList();
}

Future<List<Author>> getAllAuthors() async {
  Response response =
      await get(Uri.parse(endpoint + "author/all"), headers: headers);

  if (response.statusCode == 200) {
    return parseAuthors(response.body);
  } else {
    throw Exception('Error: statusCode= ${response.statusCode}');
  }
}
