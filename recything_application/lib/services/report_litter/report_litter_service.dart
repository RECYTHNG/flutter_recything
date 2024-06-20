import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/controllers/report_litter_controller.dart';
import 'package:recything_application/utils/shared_pref.dart';
import 'package:http_parser/http_parser.dart';

class ReportLitterService {
  final Dio _dio = Dio();
  final url = '$recythingBaseUrl/report';

  Future<int> sendReport(ReportLitterController controller) async {
    try {
      String token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDA1NCIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIxNDQ5MTkwfQ.k891APrZbfnw0oDnQ86ozvu94n1rMXSG1DI-rfrEhzo';
      FormData formData = FormData();
      var jsonData = jsonEncode({
        'latitude': controller.lat.value,
        'longitude': controller.long.value,
        'address': controller.address.value,
        'city': controller.city.value,
        'province': controller.province.value,
        'title': controller.title.value,
        'description': controller.condition.value,
        'waste_type': controller.litterType.value,
        'report_type': 'littering',
        'waste_materials': [],
      });
      formData.fields.add(MapEntry('json_data', jsonData));
      for (var file in controller.imageFiles) {
        if (file != null) {
          var multipartFile = await MultipartFile.fromFile(
            file.path,
            filename: file.name,
            contentType: MediaType('image', 'jpeg'),
          );
          formData.files.add(MapEntry('images', multipartFile));
        }
      }
      final response = await _dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.statusCode!;
    } on DioException catch (e) {
      throw Exception('${e.response?.statusCode}');
    }
  }
}
