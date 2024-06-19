import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:recything_application/env/env.dart';
import 'package:recything_application/models/user/user_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class ProfileService {
  var baseUrl = Env.recythingBaseUrl;
  Future<Map<String, dynamic>> putUser(Map<String, dynamic> userData) async {
    try {
      String? authToken = await SharedPref.getToken();
      var url = "$baseUrl/user/profile";
      var response = await Dio().put(
        url,
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

  Future<UserModel> uploadAvatar(XFile pickedImage) async {
    try {
      String? authToken = await SharedPref.getToken();
      var url = "$baseUrl/user/uploadAvatar";
      var mimeType = lookupMimeType(pickedImage.path) ?? 'multipart/form-data';

      var contentType = MediaType.parse(mimeType);

      MultipartFile multipartFile = await MultipartFile.fromFile(
        pickedImage.path,
        filename: pickedImage.name,
        contentType: contentType,
      );

      FormData formData = FormData.fromMap(
        {"image": multipartFile},
      );

      var response = await Dio().post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'multipart/form-data',
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
