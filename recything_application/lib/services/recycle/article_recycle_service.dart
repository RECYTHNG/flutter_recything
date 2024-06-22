import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/controllers/global_controller.dart';
import 'package:recything_application/models/recycle/article_recycle_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class ArticleRecycleService {
  final Dio _dio = Dio();

  Future<ArticleRecycleModel> getArticle({bool? isSorted}) async {
    try {
      final token = await SharedPref.getToken();
      final Map<String, String> queryParams = {};
      if (isSorted == true) {
        queryParams['sort_by'] = 'created_at';
        queryParams['sort_type'] = 'desc';
      }
      final response = await _dio.get(
        '$recythingBaseUrl/articles',
        queryParameters: queryParams,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final jsonResponse = response.data as Map<String, dynamic>;
      return ArticleRecycleModel.fromJson(jsonResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        Get.find<GlobalController>().showExpiredSessionDialog();
      }
      throw Exception(
        'Error ${e.response?.statusCode} ${e.response?.statusMessage}',
      );
    }
  }
}
