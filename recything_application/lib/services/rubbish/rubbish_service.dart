import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/controllers/map_rubbish_controller.dart';
import 'package:recything_application/utils/shared_pref.dart';

class ReportRubbishService {
  final Dio _dio = Dio();
  final url = '$recythingBaseUrl/report';

  Future<int> sendReport(MapRubbishController controller) async {
    try {
      final token = await SharedPref.getToken();
      FormData formData = FormData();
      var jsonData = jsonEncode({
        'latitude': controller.lat.value,
        'longitude': controller.long.value,
        'address': controller.address.value,
        'city': controller.city.value,
        'province': controller.province.value,
        'description': controller.condition.value,
        'waste_type': controller.rubbishType.value,
        'report_type': 'rubbish',
        'waste_materials': controller.selectedMaterial,
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
      throw Exception('${e.response?.statusMessage}');
    }
  }
}