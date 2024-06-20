// To parse this JSON data, do
//
//     final videoContentModel = videoContentModelFromJson(jsonString);

import 'dart:convert';

VideoContentModel videoContentModelFromJson(String str) =>
    VideoContentModel.fromJson(json.decode(str));

String videoContentModelToJson(VideoContentModel data) =>
    json.encode(data.toJson());

class VideoContentModel {
  int? code;
  String? message;
  List<Datum>? data;

  VideoContentModel({
    this.code,
    this.message,
    this.data,
  });

  factory VideoContentModel.fromJson(Map<String, dynamic> json) =>
      VideoContentModel(
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

  Datum({
    this.id,
    this.title,
    this.description,
    this.urlThumbnail,
    this.linkVideo,
    this.viewer,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        urlThumbnail: json["url_thumbnail"],
        linkVideo: json["link_video"],
        viewer: json["viewer"],
      );

  get length => null;

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "url_thumbnail": urlThumbnail,
        "link_video": linkVideo,
        "viewer": viewer,
      };
}
