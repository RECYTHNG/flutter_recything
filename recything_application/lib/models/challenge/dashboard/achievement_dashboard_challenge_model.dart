class AchievementDashboardChallengeModel {
  final int code;
  final String message;
  final Data data;

  AchievementDashboardChallengeModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory AchievementDashboardChallengeModel.fromJson(Map<String, dynamic> json) {
    return AchievementDashboardChallengeModel(
      code: json['code'],
      message: json['message'],
      data: Data.fromJson(json['data'] ?? {}),
    );
  }
}

class Data {
  final List<DataAchievement> dataAchievement;
  final DataUser dataUser;
  final dynamic historyUserPoint;

  Data({
    required this.dataAchievement,
    required this.dataUser,
    this.historyUserPoint,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['data_achievement'] as List<dynamic>? ?? [];
    List<DataAchievement> dataAchievementList = list.map((i) => DataAchievement.fromJson(i)).toList();

    return Data(
      dataAchievement: dataAchievementList,
      dataUser: DataUser.fromJson(json['data_user'] ?? {}),
      historyUserPoint: json['history_user_point'],
    );
  }
}

class DataAchievement {
  final int id;
  final String level;
  final int targetPoint;
  final String badgeUrl;

  DataAchievement({
    required this.id,
    required this.level,
    required this.targetPoint,
    required this.badgeUrl,
  });

  factory DataAchievement.fromJson(Map<String, dynamic> json) {
    return DataAchievement(
      id: json['id'] ?? 0,
      level: json['level'] ?? '',
      targetPoint: json['target_point'] ?? 0,
      badgeUrl: json['badge_url'] ?? '',
    );
  }
}

class DataUser {
  final String id;
  final String name;
  final int point;
  final String badge;

  DataUser({
    required this.id,
    required this.name,
    required this.point,
    required this.badge,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      point: json['point'] ?? 0,
      badge: json['badge'] ?? '',
    );
  }
}