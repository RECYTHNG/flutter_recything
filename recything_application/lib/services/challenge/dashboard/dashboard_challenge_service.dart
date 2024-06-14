import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/models/challenge/all_challenge_model.dart';
import 'package:recything_application/models/challenge/dashboard/on_progress_dashboard_challenge_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class DashboardChallengeService {
  final Dio _dio = Dio();

  Future<AllChallengeModel> getAllChallenge() async {
    try {
      final token = await SharedPref.getToken();
      final response = await _dio.get(
        '$recythingBaseUrl/user/tasks',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final jsonResponse = response.data as Map<String, dynamic>;
      return AllChallengeModel.fromJson(jsonResponse);
    } on DioException catch (e) {
      rethrow;
    }
  }

  Future<OnProgressDashboardChallengeModel> getOnProgressChallenge() async {
    try {
      final token = await SharedPref.getToken();
      final response = await _dio.get(
        '$recythingBaseUrl/user-current/tasks/in-progress',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final jsonResponse = response.data as Map<String, dynamic>;
      return OnProgressDashboardChallengeModel.fromJson(jsonResponse);
    } on DioException catch (e) {
      rethrow;
    }
  }
}
