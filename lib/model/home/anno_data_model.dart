class Anno {
  int? id;
  String? title;
  String? summary;
  String? content;
  String? image;
  String? type;
  String? createdAt;
  String? formattedCreatedAt;

  Anno(
      {this.id,
      this.title,
      this.summary,
      this.content,
      this.image,
      this.type,
      this.createdAt,
      this.formattedCreatedAt});

  Anno.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    summary = json['summary'];
    content = json['content'];
    image = json['image'];
    type = json['type'];
    createdAt = json['created_at'];
    formattedCreatedAt = json['formatted_created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['content'] = this.content;
    data['image'] = this.image;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['formatted_created_at'] = this.formattedCreatedAt;
    return data;
  }
}
