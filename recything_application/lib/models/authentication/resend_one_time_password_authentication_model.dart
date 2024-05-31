import 'dart:convert';

ResendOneTimePasswordAuthenticationModel
    resendOneTimePasswordAuthenticationModelFromJson(String str) =>
        ResendOneTimePasswordAuthenticationModel.fromJson(json.decode(str));

String resendOneTimePasswordAuthenticationModelToJson(
        ResendOneTimePasswordAuthenticationModel data) =>
    json.encode(data.toJson());

class ResendOneTimePasswordAuthenticationModel {
  int? code;
  String? message;

  ResendOneTimePasswordAuthenticationModel({
    this.code,
    this.message,
  });

  factory ResendOneTimePasswordAuthenticationModel.fromJson(
          Map<String, dynamic> json) =>
      ResendOneTimePasswordAuthenticationModel(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
