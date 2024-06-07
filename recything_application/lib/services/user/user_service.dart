import 'package:dio/dio.dart';
import 'package:recything_application/env/env.dart';
import 'package:recything_application/models/user/user_model.dart';

class UserService {
  var baseUrl = Env.recythingBaseUrl;
  Future<UserModel> getUser() async {
    try {
      var url =
          "http://ec2-54-79-237-162.ap-southeast-2.compute.amazonaws.com:8080/api/v1/user/profile";
      var authToken =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwNiIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE4MDIyMzgwfQ.wS_FNrWskyjRf6apfpjlRS8G5oCYveWWz536DCUPCRI";
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
