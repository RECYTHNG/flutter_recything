import 'package:dio/dio.dart';
import 'package:recything_application/models/achievement_model.dart';

class AchievementService {
  final Dio dio = Dio();

  Future<AchievementModel> getAchievement() async {
    try {
      var url = 'http://10.0.2.2:8080/api/v1/user/achievements';
      var authToken =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwMSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE4NDQ0NDU1fQ.V-KqWJ2dI2y_ZgL8LVyo_ChsA2zfSp3Gi-4iIbv1wEU';
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Authorization': 'Bearer $authToken',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return AchievementModel.fromJson(response.data);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized');
      } else {
        throw Exception('Failed to load achievement');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load Achievement: ${e.error}');
    }
  }
}
