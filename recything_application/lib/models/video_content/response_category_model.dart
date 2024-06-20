// To parse this JSON data, do
//
//     final ResponseGetCategoryModel = ResponseGetCategoryModelFromJson(jsonString);

import 'dart:convert';

ResponseGetCategoryModel ResponseGetCategoryModelFromJson(String str) =>
    ResponseGetCategoryModel.fromJson(json.decode(str));

String ResponseGetCategoryModelToJson(ResponseGetCategoryModel data) =>
    json.encode(data.toJson());

class ResponseGetCategoryModel {
  int? code;
  String? message;
  List<Datum>? data;

  ResponseGetCategoryModel({
    this.code,
    this.message,
    this.data,
  });

  factory ResponseGetCategoryModel.fromJson(Map<String, dynamic> json) =>
      ResponseGetCategoryModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? title;
  String? description;
  String? urlThumbnail;
  String? linkVideo;
  int? viewer;
  List<Category>? contentCategories;
  List<Category>? wasteCategories;

  Datum({
    this.id,
    this.title,
    this.description,
    this.urlThumbnail,
    this.linkVideo,
    this.viewer,
    this.contentCategories,
    this.wasteCategories,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        urlThumbnail: json["url_thumbnail"],
        linkVideo: json["link_video"],
        viewer: json["viewer"],
        contentCategories: json["content_categories"] == null
            ? []
            : List<Category>.from(
                json["content_categories"]!.map((x) => Category.fromJson(x))),
        wasteCategories: json["waste_categories"] == null
            ? []
            : List<Category>.from(
                json["waste_categories"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "url_thumbnail": urlThumbnail,
        "link_video": linkVideo,
        "viewer": viewer,
        "content_categories": contentCategories == null
            ? []
            : List<dynamic>.from(contentCategories!.map((x) => x.toJson())),
        "waste_categories": wasteCategories == null
            ? []
            : List<dynamic>.from(wasteCategories!.map((x) => x.toJson())),
      };
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
