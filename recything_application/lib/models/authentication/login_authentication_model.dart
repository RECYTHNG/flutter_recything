import 'dart:convert';

LoginAuthenticationModel loginAuthenticationModelFromJson(String str) =>
    LoginAuthenticationModel.fromJson(json.decode(str));

String loginAuthenticationModelToJson(LoginAuthenticationModel data) =>
    json.encode(data.toJson());

class LoginAuthenticationModel {
  int? code;
  String? message;
  Data? data;

  LoginAuthenticationModel({
    this.code,
    this.message,
    this.data,
  });

  factory LoginAuthenticationModel.fromJson(Map<String, dynamic> json) =>
      LoginAuthenticationModel(
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
  String? email;
  String? token;

  Data({
    this.email,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "token": token,
      };
}
