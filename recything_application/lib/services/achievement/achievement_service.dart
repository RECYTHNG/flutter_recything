import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/models/achievement_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class AchievementService {
  final Dio dio = Dio();
  var baseUrl = recythingBaseUrl;

  Future<AchievementModel> getAchievement() async {
    try {
      var url = '$baseUrl/user/achievements';
      String? authToken = await SharedPref.getToken();
      if (authToken == null) {
        throw Exception('Tidak ada token yang ditemukan');
      }

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
