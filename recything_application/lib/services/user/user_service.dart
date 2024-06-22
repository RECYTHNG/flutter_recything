import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/global_controller.dart';
import 'package:recything_application/env/env.dart';
import 'package:recything_application/models/user/user_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class UserService {
  var baseUrl = Env.recythingBaseUrl;
  Future<UserModel> getUser() async {
    try {
      var url = "$baseUrl/user/profile";
      String? authToken = await SharedPref.getToken();
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
      if (e.response?.statusCode == 401) {
        Get.find<GlobalController>().showExpiredSessionDialog();
      }
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
