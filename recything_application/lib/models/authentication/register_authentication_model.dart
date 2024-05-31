import 'dart:convert';

RegisterAuthenticationModel registerAuthenticationModelFromJson(String str) =>
    RegisterAuthenticationModel.fromJson(json.decode(str));

String registerAuthenticationModelToJson(RegisterAuthenticationModel data) =>
    json.encode(data.toJson());

class RegisterAuthenticationModel {
  int? code;
  String? message;
  Data? data;

  RegisterAuthenticationModel({
    this.code,
    this.message,
    this.data,
  });

  factory RegisterAuthenticationModel.fromJson(Map<String, dynamic> json) =>
      RegisterAuthenticationModel(
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
  String? userId;
  String? name;
  String? email;
  bool? isVerified;

  Data({
    this.userId,
    this.name,
    this.email,
    this.isVerified,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        isVerified: json["is_verified"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "is_verified": isVerified,
      };
}
