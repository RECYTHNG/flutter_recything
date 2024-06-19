import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/utils/shared_pref.dart';
// import 'package:recything_application/utils/shared_pref.dart';

class GetAllRLeaderboardService {
  final Dio dio = Dio();
  var baseUrl = recythingBaseUrl;

  Future<String> postQuestion(String question) async {
    try {
      var url = '$baseUrl/leaderboard';
      String? authToken = await SharedPref.getToken();
      if (authToken == null) {
        throw Exception('Tidak ada token yang ditemukan');
      }

      final response = await dio.post(
        url,
        data: jsonEncode({'question': question}),
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $authToken',
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to get response from API');
      }
    } on DioException catch (e) {
      throw Exception('Failed to get response from API: ${e.message}');
    }
  }
}
