import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:recything_application/env/env.dart';
import 'package:recything_application/models/user/user_model.dart';

class ProfileService {
  var baseUrl = Env.recythingBaseUrl;
  var authToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwNCIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIwOTM1ODA2fQ.XCiRcJ92sD4TwW5cxzKmqxhW_TGsdNgjI_RNY-EPVI4";
  Future<Map<String, dynamic>> putUser(Map<String, dynamic> userData) async {
    try {
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
