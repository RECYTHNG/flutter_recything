import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/controllers/map_rubbish_controller.dart';

class ReportRubbishService {
  final Dio _dio = Dio();
  String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwNCIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE4MTY1MjU0fQ.DWq9x1icRGpv9O04HT3FGmJ07-8oh2tloy_nyl1ex7s';

  Future<int> sendReport(MapRubbishController controller) async {
    String url = '$recythingBaseUrl/report';

    try {
      FormData formData = FormData();
      formData.fields.addAll([
        MapEntry('json_data', jsonEncode({
          'latitude': controller.lat.value,
          'longitude': controller.long.value,
          'address': controller.address.value,
          'city': controller.city.value,
          'province': controller.province.value,
          'description': controller.condition.value,
          'waste_type': controller.rubbishType.value,
          'report_type': 'rubbish',
          'waste_materials': controller.selectedMaterial.value,
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
