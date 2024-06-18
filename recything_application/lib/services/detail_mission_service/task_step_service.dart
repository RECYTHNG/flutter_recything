import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:recything_application/env/env.dart';

class TaskStepService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Env.recythingBaseUrl,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAzNCIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIxMzA1ODMwfQ.ZQJ-KErnUGP8R8F2RWY6YYhRpCpkpx1T1AWwuY0JHls',
      },
    ),
  );

  Future<Map<String, dynamic>> getTaskStart(String taskId) async {
    try {
      final response = await _dio.get('/user/tasks/$taskId');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load mission steps');
      }
    } catch (e) {
      throw Exception('Failed to load mission steps: $e');
    }
  }

  Future<Map<String, dynamic>> getTaskProgressById(String userTaskId) async {
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

  Future<Map<String, dynamic>> postTaskById(
      String taskId, RxMap<dynamic, dynamic> data) async {
    try {
      final response = await _dio.post(
        '/user/tasks/TM0001',
        data: {},
        options: Options(
          headers: <String, String>{
            'Content-Length': '0',
          },
        ),
      );
      print(response.data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to get response from API');
      }
    } catch (e) {
      throw Exception('Failed to submit data: $e');
    }
  }

  Future<Map<String, dynamic>> putTaskStepCompletion(
      String userTaskId, int taskStepId) async {
    try {
      final response = await _dio.put(
        '/user-current/steps',
        data: {
          'user_task_id': userTaskId,
          'task_step_id': taskStepId,
        },
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to get response from API');
      }
    } catch (e) {
      throw Exception('Failed to submit data: $e');
    }
  }
}
