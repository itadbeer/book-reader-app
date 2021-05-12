class Book {
  BookResult result;

  Book({this.result});

  Book.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new BookResult.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class BookResult {
  List<int> authorId;
  List<int> categoryId;
  String description;
  int discountPercentage;
  int id;
  String image;
  String name;
  int pagesCount;
  int price;
  String publishDate;
  List<int> publisherId;
  List<int> translatorId;

  BookResult(
      {this.authorId,
      this.categoryId,
      this.description,
      this.discountPercentage,
      this.id,
      this.image,
      this.name,
      this.pagesCount,
      this.price,
      this.publishDate,
      this.publisherId,
      this.translatorId});

  BookResult.fromJson(Map<String, dynamic> json) {
    authorId = json['author_id'].cast<int>();
    categoryId = json['category_id'].cast<int>();
    description = json['description'];
    discountPercentage = json['discount_percentage'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    pagesCount = json['pages_count'];
    price = json['price'];
    publishDate = json['publish_date'];
    publisherId = json['publisher_id'].cast<int>();
    translatorId = json['translator_id'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author_id'] = this.authorId;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['discount_percentage'] = this.discountPercentage;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['pages_count'] = this.pagesCount;
    data['price'] = this.price;
    data['publish_date'] = this.publishDate;
    data['publisher_id'] = this.publisherId;
    data['translator_id'] = this.translatorId;
    return data;
  }
}
