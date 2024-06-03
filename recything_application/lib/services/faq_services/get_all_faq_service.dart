import 'package:dio/dio.dart';
import 'package:recything_application/models/faq/get_all_faq_model.dart';

class GetAllFaqService {
  final Dio dio = Dio();

  Future<GetAllFaqModel> getAllFaq() async {
    try {
      var url = 'http://10.0.2.2:8080/api/v1/faqs';
      var authToken =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwMiIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE3NjYxMDI5fQ.dK1mEygGuieRrQQY6FtkF3g0AG-1xudUjGYHVXA9vd8';
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Authorization': 'Bearer $authToken',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetAllFaqModel.fromJson(response.data);
      } else if (response.statusCode == 401) {
        throw Exception(response.data['message'] ?? 'Unauthorized');
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load FAQs: ${e.error}');
    }
  }
}
