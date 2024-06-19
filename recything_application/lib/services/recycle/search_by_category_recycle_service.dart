import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/models/recycle/category/article_category_recycle_model.dart';
import 'package:recything_application/models/recycle/category/video_category_recycle_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class SearchByCategoryRecycleService {
  final Dio _dio = Dio();
  final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAzNCIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIxMTg0NjUzfQ.IFcd5a7Vsxgs4TQo1UG_braA7Gb3jJEk8vprl8mkaf4';

  Future<ArticleCategoryRecycleModel> getArticleByCategory(String category) async {
    try {
      // final token = SharedPref.getToken();
      final response = await _dio.get(
        '$recythingBaseUrl/article/category',
        queryParameters: {
          'type': 'waste',
          'name': category,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final jsonResponse = response.data as Map<String, dynamic>;
      return ArticleCategoryRecycleModel.fromJson(jsonResponse);
    } on DioException catch (e) {
      throw Exception(
        'Error ${e.response?.statusCode} ${e.response?.statusMessage}',
      );
    }
  }

  Future<VideoCategoryRecycleModel> getVideoByCategory(String category) async {
    try {
      // final token = SharedPref.getToken();
      final response = await _dio.get(
        '$recythingBaseUrl/videos',
        queryParameters: {
          'type': 'waste',
          'name': category,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final jsonResponse = response.data as Map<String, dynamic>;
      return VideoCategoryRecycleModel.fromJson(jsonResponse);
    } on DioException catch (e) {
      throw Exception(
        'Error ${e.response?.statusCode} ${e.response?.statusMessage}',
      );
    }
  }
}
