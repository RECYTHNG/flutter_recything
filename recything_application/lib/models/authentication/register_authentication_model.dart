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
        code: json["code"] ?? 0,
        message: json["message"] == null ? null : json["message"] ?? '',
        data: json["data"] == null ? null : Data.fromJson(json["data"] ?? {}),
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
  String? phoneNumber;
  bool? isVerified;

  Data({
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
    this.isVerified,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"] ?? '',
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        phoneNumber: json["phone_number"] ?? '',
        isVerified: json["is_verified"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "is_verified": isVerified,
      };
}
