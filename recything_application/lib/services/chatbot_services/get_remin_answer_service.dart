import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:recything_application/env/env.dart';

class GetReminAnswerService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: (Env.recythingBaseUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwMSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE4MDM3NTI4fQ.g3UgMZcZAKtqmNSRVXkcJ9ak3jRD5g9siilQ1qPKjtY',
      },
    ),
  );

  Future<String> postQuestion(String question) async {
    try {
      final response = await _dio.post(
        '/remin-ai',
        data: jsonEncode({'question': question}),
      );

      if (response.statusCode == 200) {
        return response.data['data']['answer_ai'];
      } else {
        throw Exception('Failed to get response from API');
      }
    } on DioException catch (e) {
      throw Exception('Failed to get response from API: ${e.message}');
    }
  }
}
