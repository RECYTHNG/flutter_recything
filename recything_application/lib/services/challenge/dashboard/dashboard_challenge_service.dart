import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/models/challenge/dashboard/all_dashboard_challenge_model.dart';
import 'package:recything_application/models/challenge/dashboard/user_dashboard_challenge_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class DashboardChallengeService {
  final Dio _dio = Dio();

  Future<AllDashboardChallengeModel> getAllChallenge() async {
    try {
      final token = await SharedPref.getToken();
      final response = await _dio.get(
        '$recythingBaseUrl/user/tasks',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final jsonResponse = response.data as Map<String, dynamic>;
      return AllDashboardChallengeModel.fromJson(jsonResponse);
    } on DioException catch (e) {
      throw 'Error: ${e.response!.statusCode}';
    }
  }

  Future<UserDashboardChallengeModel> getOnProgressChallenge() async {
    try {
      final token = await SharedPref.getToken();
      final response = await _dio.get(
        '$recythingBaseUrl/user-current/tasks/in-progress',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final jsonResponse = response.data as Map<String, dynamic>;
      return UserDashboardChallengeModel.fromJson(jsonResponse);
    } on DioException catch (e) {
      throw 'Error: ${e.response!.statusCode}';
    }
  }

  Future<UserDashboardChallengeModel> getDoneChallenge() async {
    try {
      final token = await SharedPref.getToken();
      final response = await _dio.get(
        '$recythingBaseUrl/user-current/tasks/done',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final jsonResponse = response.data as Map<String, dynamic>;
      return UserDashboardChallengeModel.fromJson(jsonResponse);
    } on DioException catch (e) {
      throw 'Error: ${e.response!.statusCode}';
    }
  }

  Future<UserDashboardChallengeModel> getHistoryChallenge() async {
    try {
      final token = await SharedPref.getToken();
      final response = await _dio.get(
        '$recythingBaseUrl/user-current/tasks/history',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final jsonResponse = response.data as Map<String, dynamic>;
      return UserDashboardChallengeModel.fromJson(jsonResponse);
    } on DioException catch (e) {
      throw 'Error: ${e.response!.statusCode}';
    }
  }
}
