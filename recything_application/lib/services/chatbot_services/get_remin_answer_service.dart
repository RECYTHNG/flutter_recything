import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/controllers/global_controller.dart';
import 'package:recything_application/utils/shared_pref.dart';

class GetReminAnswerService {
  final Dio dio = Dio();
  var baseUrl = recythingBaseUrl;

  Future<String> postQuestion(String question) async {
    try {
      var url = '$baseUrl/remin-ai';
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
        return response.data['data']['answer_ai'];
      } else {
        throw Exception('Failed to get response from API');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        Get.find<GlobalController>().showExpiredSessionDialog();
      }
      throw Exception('Failed to get response from API: ${e.message}');
    }
  }
}
