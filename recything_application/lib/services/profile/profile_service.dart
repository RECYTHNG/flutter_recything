import 'package:dio/dio.dart';

class ProfileService {
  static Future<Map<String, dynamic>> putUser(
      Map<String, dynamic> userData) async {
    try {
      var url =
          "http://ec2-54-79-237-162.ap-southeast-2.compute.amazonaws.com:8080/api/v1";
      var authToken =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwNCIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE4MDI4MDA4fQ.eZuTtwJBNDobmON5pSJclKCaCwT8hv32uC2MoXConOU";

      var response = await Dio().put(
        '$url/user/profile',
        data: userData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );

      return {'code': response.statusCode, 'message': response.data["message"]};
    } on DioException catch (e) {
      return {
        'code': e.response?.statusCode ?? 500,
        'message': e.response?.data["message"] ?? "Unknown error"
      };
    }
  }
}
