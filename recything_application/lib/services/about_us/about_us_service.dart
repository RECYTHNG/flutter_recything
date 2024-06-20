import 'package:dio/dio.dart';
import 'package:recything_application/env/env.dart';
import 'package:recything_application/models/about_us/about_us_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class AboutUsService {
  var baseUrl = Env.recythingBaseUrl;
  Future<AboutUsModel> getAboutUs(String param) async {
    try {
       String? authToken = await SharedPref.getToken();
      if (authToken == null) {
        throw Exception('Tidak ada token yang ditemukan');
      }
      
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
