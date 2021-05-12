class Publisher {
  PublisherResult result;

  Publisher({this.result});

  Publisher.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null
        ? new PublisherResult.fromJson(json['result'])
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

class PublisherResult {
  String description;
  int id;
  String name;

  PublisherResult({this.description, this.id, this.name});

  PublisherResult.fromJson(Map<String, dynamic> json) {
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
