import 'package:dio/dio.dart';
import 'package:recything_application/models/user/user_model.dart';

class UserService {
  static Future<UserModel> getUser() async {
    try {
      var url = "http://10.0.2.2:8080/api/v1/user/profile";
      var authToken =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwMiIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE3NTE0MzgyfQ.R2ESimrCv0HCJMuqrRLtwysOIMpi_T8hd5KvUMdR1OY";
      var response = await Dio().get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );
      if (response.statusCode == 200) {
        return UserModel(
          code: response.statusCode,
          data: Data.fromJson(response.data["data"]),
          message: response.data["message"],
        );
      } else {
        return UserModel(
          code: response.statusCode,
          message: response.data["message"],
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return UserModel(
          code: e.response?.statusCode,
          message: e.response?.data["message"] ?? "Unknown error",
        );
      } else {
        return UserModel(
          code: 500,
          message: "An unexpected error occurred",
        );
      }
    }
  }
}