// To parse this JSON data, do
//
//     final detailVideoContentModel = detailVideoContentModelFromJson(jsonString);

import 'dart:convert';

DetailVideoContentModel detailVideoContentModelFromJson(String str) => DetailVideoContentModel.fromJson(json.decode(str));

String detailVideoContentModelToJson(DetailVideoContentModel data) => json.encode(data.toJson());

class DetailVideoContentModel {
    int? code;
    String? message;
    Data? data;

    DetailVideoContentModel({
        this.code,
        this.message,
        this.data,
    });

    factory DetailVideoContentModel.fromJson(Map<String, dynamic> json) => DetailVideoContentModel(
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
    DataVideo? dataVideo;
    dynamic comments;

    Data({
        this.dataVideo,
        this.comments,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataVideo: json["data_video"] == null ? null : DataVideo.fromJson(json["data_video"]),
        comments: json["comments"],
    );

    Map<String, dynamic> toJson() => {
        "data_video": dataVideo?.toJson(),
        "comments": comments,
    };
}

class DataVideo {
    int? id;
    String? title;
    String? description;
    String? urlThumbnail;
    String? linkVideo;
    int? viewer;

    DataVideo({
        this.id,
        this.title,
        this.description,
        this.urlThumbnail,
        this.linkVideo,
        this.viewer,
    });

    factory DataVideo.fromJson(Map<String, dynamic> json) => DataVideo(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        urlThumbnail: json["url_thumbnail"],
        linkVideo: json["link_video"],
        viewer: json["viewer"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "url_thumbnail": urlThumbnail,
        "link_video": linkVideo,
        "viewer": viewer,
    };
}
