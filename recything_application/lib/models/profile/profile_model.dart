import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  int? code;
  String? message;
  Data? data;

  ProfileModel({
    this.code,
    this.message,
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
  String? avatarUrl;

  Data({
    this.avatarUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        avatarUrl: json["avatar_url"],
      );

  Map<String, dynamic> toJson() => {
        "avatar_url": avatarUrl,
      };
}
