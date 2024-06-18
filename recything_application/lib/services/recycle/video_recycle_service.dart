import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/models/recycle/video_recycle_model.dart';

class VideoRecycleService {
  final Dio _dio = Dio();

  Future<VideoRecycleModel> getVideo() async {
    try {
      // final token = SharedPref.getToken();
      const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAzNCIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIxMTg0NjUzfQ.IFcd5a7Vsxgs4TQo1UG_braA7Gb3jJEk8vprl8mkaf4';
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