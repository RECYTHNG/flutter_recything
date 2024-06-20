import 'package:dio/dio.dart';
import 'package:recything_application/env/env.dart';
import 'package:recything_application/models/article/article_model.dart';
import 'package:recything_application/models/article/list_article_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class ArticleService {
  final String base = Env.recythingBaseUrl;
  final Dio _dio = Dio();

  Future<ListArticleModel> getAllArticles({String? keyword}) async {
    try {
      var url = "$base/article/search";
      String? authToken = await SharedPref.getToken();
      if (authToken == null) {
        throw Exception('Tidak ada token yang ditemukan');
      }

      if (keyword != null && keyword.isNotEmpty) {
        url += "?keyword=$keyword";
      }

      var response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );

      if (response.statusCode == 200) {
        return ListArticleModel.fromJson(response.data);
      } else {
        return ListArticleModel(
          code: response.statusCode,
          message: response.data["message"],
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return ListArticleModel(
          code: e.response!.statusCode!,
          message: e.response!.data["message"] ?? "Unknown error",
        );
      } else {
        return ListArticleModel(
          code: 500,
          message: "An unexpected error occurred",
        );
      }
    }
  }

  Future<ArticleModel> getArticleById({required String id}) async {
    try {
      var url = "$base/article/$id";
      var authToken =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwNCIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIwOTcyNjg0fQ.1gS0T0FXve-C6VnTtV1gUdVcqjY04_nfjkaww8yLNUg";

      var response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );

      if (response.statusCode == 200) {
        return ArticleModel.fromJson(response.data);
      } else {
        return ArticleModel(
          code: response.statusCode,
          message: response.data["message"],
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return ArticleModel(
          code: e.response!.statusCode!,
          message: e.response!.data["message"] ?? "Unknown error",
        );
      } else {
        return ArticleModel(
          code: 500,
          message: "An unexpected error occurred",
        );
      }
    }
  }

  Future<Map<String, dynamic>> postComment(
      {required String id, required String comment}) async {
    try {
      var url = "$base/article/$id/comment";
      var authToken =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwNCIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIwOTcyNjg0fQ.1gS0T0FXve-C6VnTtV1gUdVcqjY04_nfjkaww8yLNUg";
      final response = await _dio.post(
        url,
        data: {'comment': comment},
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
