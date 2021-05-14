import 'package:test/test.dart';
import 'package:ibr/api/categories.dart';
import 'package:ibr/api/category.dart';

void main() {
  test("parses categories", () {
    const jsonStr = """{
      "results": 
        [
          {
              "id": 1,
              "name": "فقه"
          },
          {
              "id": 2,
              "name": "عقیده"
          },
          {
              "id": 3,
              "name": "عقیده"
          }
        ]
    }""";
    expect(parseCategories(jsonStr).first.id, 1);
  });
  test('parses a single category', () {
    const jsonStr = """
      {
        "id": 1,
        "name": "فقه"
      }
    """;
    expect(parseCategory(jsonStr).id, 1);
  });
}
