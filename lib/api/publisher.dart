import 'package:ibr/ibr.dart';
import 'package:ibr/models/publisher.dart';

List<Publisher> parsePublishers(String jsonStr) {
  final parsed = json.decode(jsonStr)["results"];
  List<Publisher> publishers =
      List<Publisher>.from(parsed.map((model) => Publisher.fromJson(model)));
  return publishers;
}

getPublisher(BuildContext context, {int publisherId}) {
  final publishers = Provider.of<List<Publisher>>(context);
  return publishers
      .firstWhere((Publisher publisher) => publisher.id == publisherId);
}

Future<List<Publisher>> getAllPublishers({int limit = 0}) async {
  Response response = await get(
      Uri.parse(endpoint + "publisher/all?limit=$limit"),
      headers: headers);

  if (response.statusCode == 200) {
    return parsePublishers(response.body);
  } else {
    throw Exception('Error: statusCode= ${response.statusCode}');
  }
}
