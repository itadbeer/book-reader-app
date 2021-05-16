import 'package:ibr/api/books.dart';
import 'package:test/test.dart';
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

  test('parses books', () {
    const jsonStr = """{
    "results": [
        {
            "author_id": [
                1
            ],
            "category_id": [
                1,
                2
            ],
            "description": "شرح عقیده صحاویه",
            "discount_percentage": 0,
            "id": 1,
            "image": "test.png",
            "name": "عقیده طحاویه",
            "pages_count": 100,
            "price": 0,
            "publish_date": "1400/1/1",
            "publisher_id": [
                1
            ],
            "translator_id": [
                1
            ]
        }
    ]
  }""";
    expect(parseBooks(jsonStr).first.id, 1);
  });
}
