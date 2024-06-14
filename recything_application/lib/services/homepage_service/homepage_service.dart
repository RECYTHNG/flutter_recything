import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';

class GetDataHomepageService {
  final Dio dio = Dio();
  final String baseUrl = recythingBaseUrl;

  Future<Map<String, dynamic>> fetchHomepageData() async {
    try {
      var url = '$baseUrl/homepage';
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwMSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE4NDY0ODA4fQ.WQa-Q_zFBNcKP7Wp00TTJvbxzUiysznWPX9Jl-iH7ns',
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
