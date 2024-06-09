import 'dart:convert';

AchievementModel achievementModelFromJson(String str) =>
    AchievementModel.fromJson(json.decode(str));

String achievementModelToJson(AchievementModel data) =>
    json.encode(data.toJson());

class AchievementModel {
  int? code;
  String? message;
  Data? data;

  AchievementModel({
    this.code,
    this.message,
    this.data,
  });

  factory AchievementModel.fromJson(Map<String, dynamic> json) =>
      AchievementModel(
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
  List<DataAchievement>? dataAchievement;
  DataUser? dataUser;
  dynamic historyUserPoint;

  Data({
    this.dataAchievement,
    this.dataUser,
    this.historyUserPoint,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataAchievement: json["data_achievement"] == null
            ? []
            : List<DataAchievement>.from(json["data_achievement"]!
                .map((x) => DataAchievement.fromJson(x))),
        dataUser: json["data_user"] == null
            ? null
            : DataUser.fromJson(json["data_user"]),
        historyUserPoint: json["history_user_point"],
      );

  Map<String, dynamic> toJson() => {
        "data_achievement": dataAchievement == null
            ? []
            : List<dynamic>.from(dataAchievement!.map((x) => x.toJson())),
        "data_user": dataUser?.toJson(),
        "history_user_point": historyUserPoint,
      };
}

class DataAchievement {
  int? id;
  String? level;
  int? targetPoint;
  String? badgeUrl;

  DataAchievement({
    this.id,
    this.level,
    this.targetPoint,
    this.badgeUrl,
  });

  factory DataAchievement.fromJson(Map<String, dynamic> json) =>
      DataAchievement(
        id: json["id"],
        level: json["level"],
        targetPoint: json["target_point"],
        badgeUrl: json["badge_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "level": level,
        "target_point": targetPoint,
        "badge_url": badgeUrl,
      };
}

class DataUser {
  String? id;
  String? name;
  int? point;
  String? badge;

  DataUser({
    this.id,
    this.name,
    this.point,
    this.badge,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        id: json["id"],
        name: json["name"],
        point: json["point"],
        badge: json["badge"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "point": point,
        "badge": badge,
      };
}
