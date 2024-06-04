import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_application/models/profile/profile_model.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class ProfileService {
  static Future<ProfileModel> postProfile(XFile pickedImage) async {
    try {
      var url = "http://10.0.2.2:8080/api/v1/user/uploadAvatar";
      var authToken =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwMiIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE3NTE0MzgyfQ.R2ESimrCv0HCJMuqrRLtwysOIMpi_T8hd5KvUMdR1OY";

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
        return ProfileModel(
          code: response.statusCode,
          data: Data.fromJson(response.data["data"]),
          message: response.data["message"],
        );
      } else {
        return ProfileModel(
          code: response.statusCode,
          message: response.data["message"],
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return ProfileModel(
          code: e.response?.statusCode,
          message: e.response?.data["message"] ?? "Unknown error",
        );
      } else {
        return ProfileModel(
          code: 500,
          message: "An unexpected error occurred",
        );
      }
    }
  }
}
