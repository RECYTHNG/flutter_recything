import 'package:dio/dio.dart';
import 'package:recything_application/env/env.dart';
import 'package:recything_application/models/video_content/detail_video_content_model.dart';
import 'package:recything_application/models/video_content/video_content_model.dart';

class VideoContentService {
  var baseUrl = Env.recythingBaseUrl;
  var authToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwMyIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIwOTI2NDExfQ.NIBgmfUIoUAMPmBVgZZLriRvXTXf_oLkzbVEilfkCOY";
  Future<VideoContentModel> getVideoContent() async {
    try {
      final response = await Dio().get(
        "$baseUrl/videos",
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );
      if (response.statusCode == 200) {
        return VideoContentModel.fromJson(response.data);
      } else {
        return VideoContentModel(
          code: response.statusCode,
          message: response.statusMessage,
          data: [],
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return VideoContentModel(
          code: e.response?.statusCode,
          message: e.response?.data["message"] ?? "Unknown error",
          data: [],
        );
      } else {
        return VideoContentModel(
          code: 500,
          message: "An unexpected error occurred",
          data: [],
        );
      }
    }
  }

  Future<DetailVideoContentModel> getDetailVideoContent(int id) async {
    try {
      final response = await Dio().get(
        "$baseUrl/video/$id",
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );
      if (response.statusCode == 200) {
        return DetailVideoContentModel.fromJson(response.data);
      } else {
        return DetailVideoContentModel(
          code: response.statusCode,
          message: response.statusMessage,
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return DetailVideoContentModel(
          code: e.response?.statusCode,
          message: e.response?.data["message"] ?? "Unknown error",
        );
      } else {
        return DetailVideoContentModel(
          code: 500,
          message: "An unexpected error occurred",
        );
      }
    }
  }

  Future<void> postComment(int id, String comment) async {
    try {
      final response = await Dio().post(
        "$baseUrl/videos/comment",
        data: {
          "video_id": id,
          "comment": comment,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );
      if (response.statusCode == 201) {
        print("Successfully sent comment.");
      } else {
        print("Failed to send comment: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      print("Error posting comment: ${e.toString()}");
    }
  }
}
