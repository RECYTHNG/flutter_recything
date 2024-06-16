import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/models/challenge/dashboard/achievement_dashboard_challenge_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class AchievementDashboardChallengeService {
  final Dio _dio = Dio();
  final String url = '$recythingBaseUrl/user/achievements';

  Future<AchievementDashboardChallengeModel> getAchievement() async {
    try {
      final token = await SharedPref.getToken();
      final response = await _dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final jsonResponse = response.data as Map<String, dynamic>;
      return AchievementDashboardChallengeModel.fromJson(jsonResponse);
    } on DioException catch (e) {
      throw 'Error: ${e.response!.statusCode}';
    }
  }
}