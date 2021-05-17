import 'package:ibr/ibr.dart';
import 'package:ibr/models/translator.dart';

List<Translator> parseTranslators(String jsonStr) {
  final parsed = json.decode(jsonStr)["results"];
  List<Translator> translators =
      List<Translator>.from(parsed.map((model) => Translator.fromJson(model)));
  return translators;
}

getTranslator(BuildContext context, {int translatorId}) {
  final translators = Provider.of<List<Translator>>(context);
  return translators
      .firstWhere((Translator translator) => translator.id == translatorId);
}

List<Translator> searchTranslator(BuildContext context,
    {String translatorName}) {
  final translators = Provider.of<List<Translator>>(context);
  return translators
      .where(
          (Translator translator) => translator.name.contains(translatorName))
      .toList();
}

Future<List<Translator>> getAllTranslators({int limit = 0}) async {
  Response response = await get(
      Uri.parse(endpoint + "translator/all?limit=$limit"),
      headers: headers);

  if (response.statusCode == 200) {
    return parseTranslators(response.body);
  } else {
    throw Exception('Error: statusCode= ${response.statusCode}');
  }
}
