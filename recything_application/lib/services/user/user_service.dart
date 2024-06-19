import 'package:dio/dio.dart';
import 'package:recything_application/env/env.dart';
import 'package:recything_application/models/user/user_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class UserService {
  var base = Env.recythingBaseUrl;
  Future<UserModel> getUser() async {
    try {
      String? authToken = await SharedPref.getToken();
      var url = "$base/user/profile";
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
