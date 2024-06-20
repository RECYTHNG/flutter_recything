import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/utils/shared_pref.dart';

class TaskStepService {
  final Dio dio = Dio();
  var baseUrl = recythingBaseUrl;

  Future<Map<String, dynamic>> getTaskStart(String taskId) async {
    try {
      var url = '$baseUrl/user/tasks/$taskId';
      String? authToken = await SharedPref.getToken();
      if (authToken == null) {
        throw Exception('Tidak ada token yang ditemukan');
      }

      final response = await dio.get(
        url,
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
        throw Exception('Failed to load mission steps');
      }
    } catch (e) {
      throw Exception('Failed to load mission steps: $e');
    }
  }

  Future<Map<String, dynamic>> getTaskProgressById(String userTaskId) async {
    try {
      String? authToken = await SharedPref.getToken();
      if (authToken == null) {
        throw Exception('Tidak ada token yang ditemukan');
      }

      final response = await dio.get(
        '$baseUrl/user/task/$userTaskId',
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
        throw Exception('Failed to load mission steps');
      }
    } catch (e) {
      throw Exception('Failed to load mission steps: $e');
    }
  }

  Future<Map<String, dynamic>> postTaskById(
      String taskId, RxMap<dynamic, dynamic> data) async {
    try {
      String? authToken = await SharedPref.getToken();
      if (authToken == null) {
        throw Exception('Tidak ada token yang ditemukan');
      }

      final response = await dio.post(
        '$baseUrl/user/tasks/$taskId',
        data: {},
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $authToken',
          },
        ),
      );
      if (kDebugMode) {
        print(response.data);
      }
      return response.data;
    } catch (e) {
      throw Exception('Failed to submit data: $e');
    }
  }

  Future<Map<String, dynamic>> putTaskStepCompletion(
      String userTaskId, int taskStepId) async {
    try {
      String? authToken = await SharedPref.getToken();
      if (authToken == null) {
        throw Exception('Tidak ada token yang ditemukan');
      }

      final response = await dio.put(
        '$baseUrl/user-current/steps',
        data: {
          'user_task_id': userTaskId,
          'task_step_id': taskStepId,
        },
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
    } catch (e) {
      throw Exception('Failed to submit data: $e');
    }
  }
}
