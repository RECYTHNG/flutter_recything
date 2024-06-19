import 'dart:convert';

OneTimePasswordAuthenticationModel oneTimePasswordAuthenticationModelFromJson(
        String str) =>
    OneTimePasswordAuthenticationModel.fromJson(json.decode(str));

String oneTimePasswordAuthenticationModelToJson(
        OneTimePasswordAuthenticationModel data) =>
    json.encode(data.toJson());

class OneTimePasswordAuthenticationModel {
  int? code;
  String? message;

  OneTimePasswordAuthenticationModel({
    this.code,
    this.message,
  });

  factory OneTimePasswordAuthenticationModel.fromJson(
          Map<String, dynamic> json) =>
      OneTimePasswordAuthenticationModel(
        code: json["code"] ?? 0,
        message: json["message"] == null ? null : json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
