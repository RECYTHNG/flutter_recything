import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/models/report_history/report_history_model.dart';

class ReportHistoryService {
  final _dio = Dio();
  String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwNCIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE4MTY1MjU0fQ.DWq9x1icRGpv9O04HT3FGmJ07-8oh2tloy_nyl1ex7s';

  Future<List<ReportHistoryModel>> getReportHistory() async {
    try {
      final response = await _dio.get(
        '$recythingBaseUrl/report',
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
