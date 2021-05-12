class Author {
  AuthorResult result;

  Author({this.result});

  Author.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null
        ? new AuthorResult.fromJson(json['result'])
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

class AuthorResult {
  String description;
  int id;
  String name;

  AuthorResult({this.description, this.id, this.name});

  AuthorResult.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
