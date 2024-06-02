import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:recything_application/models/report_history/report_history_model.dart';

class ReportHistoryService {
  final _dio = Dio();
  String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwMSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE3NDIwNDYwfQ.VMnKX2hMJbqSMbZdG2FJiONlE1xnlFzXd2j6SxrKSek';

  Future<List<ReportHistoryModel>> getReportHistory() async {
    try {
      String baseUrl = 'http://192.168.0.200:8080/api/v1/report';
      final response = await _dio.get(
        baseUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Response data: ${response.data.runtimeType}');
          print('Response data: ${response.data}');
        }
        if (response.data is Map<String, dynamic> && response.data['data'] is List) {
          var data = List<Map<String, dynamic>>.from(response.data['data']);
          var finalData = data.map((json) => ReportHistoryModel.fromJson(json)).toList();
          return finalData;
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to fetch report history. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw 'Error fetching report history: $e';
    } catch (e) {
      throw 'Unexpected error: $e';
    }
  }
}
