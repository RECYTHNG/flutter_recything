import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/models/recycle/category/article_category_recycle_model.dart';
import 'package:recything_application/models/recycle/category/video_category_recycle_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class SearchByCategoryRecycleService {
  final Dio _dio = Dio();

  Future<ArticleCategoryRecycleModel> getArticleByCategory(
      String category) async {
    try {
      final token = await SharedPref.getToken();
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
      final token = SharedPref.getToken();
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
