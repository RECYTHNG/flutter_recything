import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/models/recycle/video_recycle_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class VideoRecycleService {
  final Dio _dio = Dio();

  Future<VideoRecycleModel> getVideo() async {
    try {
      final token = await SharedPref.getToken();
      final response = await _dio.get(
        '$recythingBaseUrl/videos',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final jsonResponse = response.data as Map<String, dynamic>;
      return VideoRecycleModel.fromJson(jsonResponse);
    } on DioException catch (e) {
      throw Exception('Error ${e.response?.statusCode} ${e.response?.statusMessage}');
    }
  }
}