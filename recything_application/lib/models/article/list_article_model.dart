class ListArticleModel {
  int? code;
  String? message;
  List<Data>? data;

  ListArticleModel({
    this.code,
    this.message,
    this.data,
  });

  factory ListArticleModel.fromJson(Map<String, dynamic> json) {
    var data = json["data"];
    return ListArticleModel(
      code: json["code"],
      message: json["message"],
      data: data is List
          ? List<Data>.from(data.map((x) => Data.fromJson(x)))
          : (data != null ? [Data.fromJson(data)] : null),
    );
  }
}

class Data {
  String? id;
  Author? author;
  String? title;
  String? description;
  String? thumbnailUrl;
  DateTime? createdAt;
  List<Category>? wasteCategories;
  List<Category>? contentCategories;
  dynamic sections;
  List<dynamic>? comments;

  Data({
    this.id,
    this.author,
    this.title,
    this.description,
    this.thumbnailUrl,
    this.createdAt,
    this.wasteCategories,
    this.contentCategories,
    this.sections,
    this.comments,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        author: json["author"] != null ? Author.fromJson(json["author"]) : null,
        title: json["title"],
        description: json["description"],
        thumbnailUrl: json["thumbnail_url"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        wasteCategories: json["wasteCategories"] != null
            ? List<Category>.from(
                json["wasteCategories"].map((x) => Category.fromJson(x)))
            : null,
        contentCategories: json["contentCategories"] != null
            ? List<Category>.from(
                json["contentCategories"].map((x) => Category.fromJson(x)))
            : null,
        sections: json["sections"],
        comments: json["comments"] != null
            ? List<dynamic>.from(json["comments"].map((x) => x))
            : null,
      );
}

class Author {
  String? id;
  String? name;
  String? imageUrl;

  Author({
    this.id,
    this.name,
    this.imageUrl,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
      );
}

class Category {
  int? id;
  String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );
}
