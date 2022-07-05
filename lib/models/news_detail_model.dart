class NewsDetailModel {
  DetailData? data;

  NewsDetailModel({this.data});

  NewsDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data = DetailData.fromJson(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    return data;
  }
}

class DetailData {
  int? id;
  String? title;
  String? description;
  String? createdAt;
  String? image;

  DetailData({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.image,
  });

  DetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['image'] = image;

    return data;
  }
}
