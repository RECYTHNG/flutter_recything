import 'dart:convert';

class ArticleModel {
  int? code;
  String? message;
  Data? data;

  ArticleModel({
    this.code,
    this.message,
    this.data,
  });

  ArticleModel copyWith({
    int? code,
    String? message,
    Data? data,
  }) =>
      ArticleModel(
        code: code ?? this.code,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ArticleModel.fromRawJson(String str) =>
      ArticleModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
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
  List<Section>? sections;
  List<Comment>? comments;

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

  Data copyWith({
    String? id,
    Author? author,
    String? title,
    String? description,
    String? thumbnailUrl,
    DateTime? createdAt,
    List<Category>? wasteCategories,
    List<Category>? contentCategories,
    List<Section>? sections,
    List<Comment>? comments,
  }) =>
      Data(
        id: id ?? this.id,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
        createdAt: createdAt ?? this.createdAt,
        wasteCategories: wasteCategories ?? this.wasteCategories,
        contentCategories: contentCategories ?? this.contentCategories,
        sections: sections ?? this.sections,
        comments: comments ?? this.comments,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
        title: json["title"],
        description: json["description"],
        thumbnailUrl: json["thumbnail_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        wasteCategories: json["waste_categories"] == null
            ? []
            : List<Category>.from(
                json["waste_categories"]!.map((x) => Category.fromJson(x))),
        contentCategories: json["content_categories"] == null
            ? []
            : List<Category>.from(
                json["content_categories"]!.map((x) => Category.fromJson(x))),
        sections: json["sections"] == null
            ? []
            : List<Section>.from(
                json["sections"]!.map((x) => Section.fromJson(x))),
        comments: json["comments"] == null
            ? []
            : List<Comment>.from(
                json["comments"]!.map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author?.toJson(),
        "title": title,
        "description": description,
        "thumbnail_url": thumbnailUrl,
        "created_at": createdAt?.toIso8601String(),
        "waste_categories": wasteCategories == null
            ? []
            : List<dynamic>.from(wasteCategories!.map((x) => x.toJson())),
        "content_categories": contentCategories == null
            ? []
            : List<dynamic>.from(contentCategories!.map((x) => x.toJson())),
        "sections": sections == null
            ? []
            : List<dynamic>.from(sections!.map((x) => x.toJson())),
        "comments": comments == null
            ? []
            : List<dynamic>.from(comments!.map((x) => x.toJson())),
      };
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

  Author copyWith({
    String? id,
    String? name,
    String? imageUrl,
  }) =>
      Author(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
      };
}

class Comment {
  int? id;
  Author? user;
  String? articleId;
  String? comment;
  DateTime? createdAt;

  Comment({
    this.id,
    this.user,
    this.articleId,
    this.comment,
    this.createdAt,
  });

  Comment copyWith({
    int? id,
    Author? user,
    String? articleId,
    String? comment,
    DateTime? createdAt,
  }) =>
      Comment(
        id: id ?? this.id,
        user: user ?? this.user,
        articleId: articleId ?? this.articleId,
        comment: comment ?? this.comment,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Comment.fromRawJson(String str) => Comment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        user: json["user"] == null ? null : Author.fromJson(json["user"]),
        articleId: json["article_id"],
        comment: json["comment"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "article_id": articleId,
        "comment": comment,
        "created_at": createdAt?.toIso8601String(),
      };
}

class Category {
  int? id;
  String? name;

  Category({
    this.id,
    this.name,
  });

  Category copyWith({
    int? id,
    String? name,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Section {
  String? title;
  String? description;
  String? imageUrl;

  Section({
    this.title,
    this.description,
    this.imageUrl,
  });

  Section copyWith({
    String? title,
    String? description,
    String? imageUrl,
  }) =>
      Section(
        title: title ?? this.title,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory Section.fromRawJson(String str) => Section.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        title: json["title"],
        description: json["description"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "image_url": imageUrl,
      };
}
