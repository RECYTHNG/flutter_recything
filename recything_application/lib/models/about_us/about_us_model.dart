import 'dart:convert';

AboutUsModel aboutUsModelFromJson(String str) =>
    AboutUsModel.fromJson(json.decode(str));

String aboutUsModelToJson(AboutUsModel data) => json.encode(data.toJson());

class AboutUsModel {
  int? code;
  String? message;
  List<Datum>? data;

  AboutUsModel({
    this.code,
    this.message,
    this.data,
  });

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
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
  String? id;
  String? category;
  String? title;
  String? description;
  List<Image>? images;

  Datum({
    this.id,
    this.category,
    this.title,
    this.description,
    this.images,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        category: json["category"],
        title: json["title"],
        description: json["description"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "title": title,
        "description": description,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class Image {
  String? aboutUsId;
  String? imageUrl;

  Image({
    this.aboutUsId,
    this.imageUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        aboutUsId: json["about_us_id"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "about_us_id": aboutUsId,
        "image_url": imageUrl,
      };
}
