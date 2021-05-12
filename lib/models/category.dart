class Category {
  CategoryResult result;

  Category({this.result});

  Category.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null
        ? new CategoryResult.fromJson(json['result'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class CategoryResult {
  int id;
  String name;

  CategoryResult({this.id, this.name});

  CategoryResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
