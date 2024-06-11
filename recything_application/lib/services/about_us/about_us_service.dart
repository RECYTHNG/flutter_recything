import 'package:dio/dio.dart';
import 'package:recything_application/env/env.dart';
import 'package:recything_application/models/about_us/about_us_model.dart';

class AboutUsService {
  var baseUrl = Env.recythingBaseUrl;
  Future<AboutUsModel> getAboutUs(String param) async {
    try {
      var authToken =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwNiIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE4MzU2MDM4fQ.m75Sl3hHOp6RbvSS-uayY2wLxGGComQsnO00zD3t-5c";
      final response = await Dio().get(
        "$baseUrl/about-us/category",
        queryParameters: {"name": param},
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );
      if (response.statusCode == 200) {
        return AboutUsModel.fromJson(response.data);
      } else {
        return AboutUsModel(
          code: response.statusCode,
          message: response.statusMessage,
          data: [],
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return AboutUsModel(
          code: e.response?.statusCode,
          message: e.response?.data["message"] ?? "Unknown error",
          data: [],
        );
      } else {
        return AboutUsModel(
          code: 500,
          message: "An unexpected error occurred",
          data: [],
        );
      }
    }
  }
}
