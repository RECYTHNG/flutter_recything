import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/controllers/report_litter_controller.dart';

class ReportLitterService {
  final Dio _dio = Dio();
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwNCIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE4MTY1MjU0fQ.DWq9x1icRGpv9O04HT3FGmJ07-8oh2tloy_nyl1ex7s';

  Future<int> sendReport(ReportLitterController controller) async {
    String url = '$recythingBaseUrl/report';

    try {
      FormData formData = FormData();
      formData.fields.addAll([
        MapEntry(
            'json_data',
            jsonEncode({
              'title': controller.title.value,
              'latitude': controller.lat.value,
              'longitude': controller.long.value,
              'address': controller.address.value,
              'city': controller.city.value,
              'province': controller.province.value,
              'description': controller.condition.value,
              'waste_type': controller.litterType.value,
              'report_type': 'litter',
              'waste_materials': [],
            })),
      ]);

      final response = await _dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 201) {
        return response.statusCode!;
      } else {
        return response.statusCode!;
      }
    } catch (e) {
      rethrow;
    }
  }
}