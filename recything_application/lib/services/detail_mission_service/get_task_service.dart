import 'package:dio/dio.dart';
import 'package:recything_application/env/env.dart';

class GetTaskService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Env.recythingBaseUrl,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwMSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE4NDY0ODA4fQ.WQa-Q_zFBNcKP7Wp00TTJvbxzUiysznWPX9Jl-iH7ns',
      },
    ),
  );

  Future<Map<String, dynamic>> getDataChallenge(String userTaskId) async {
    try {
      final response = await _dio.get('/user/task/$userTaskId');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load mission steps');
      }
    } catch (e) {
      throw Exception('Failed to load mission steps: $e');
    }
  }
}
