import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? code;
  String? message;
  Data? data;

  UserModel({
    this.code,
    this.message,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
  UserModel copyWith({
    int? code,
    String? message,
    Data? data,
  }) {
    return UserModel(
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

class Data {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  int? point;
  String? badge;
  String? gender;
  DateTime? birthDate;
  String? address;
  String? pictureUrl;

  Data({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.point,
    this.badge,
    this.gender,
    this.birthDate,
    this.address,
    this.pictureUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        point: json["point"],
        badge: json["badge"],
        gender: json["gender"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        address: json["address"],
        pictureUrl: json["picture_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "point": point,
        "badge": badge,
        "gender": gender,
        "birth_date": birthDate?.toIso8601String(),
        "address": address,
        "picture_url": pictureUrl,
      };
  Data copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    int? point,
    String? badge,
    String? gender,
    DateTime? birthDate,
    String? address,
    String? pictureUrl,
  }) {
    return Data(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      point: point ?? this.point,
      badge: badge ?? this.badge,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      address: address ?? this.address,
      pictureUrl: pictureUrl ?? this.pictureUrl,
    );
  }
}
