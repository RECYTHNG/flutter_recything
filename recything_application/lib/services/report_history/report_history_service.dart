import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/models/report_history/report_history_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class ReportHistoryService {
  final _dio = Dio();

  Future<ReportHistoryModel> getReportHistory() async {
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        '$recythingBaseUrl/report',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final jsonResponse = response.data as Map<String, dynamic>;
      return ReportHistoryModel.fromJson(jsonResponse);
    } on DioException catch (e) {
      throw '${e.response?.statusMessage}';
    }
  }
}