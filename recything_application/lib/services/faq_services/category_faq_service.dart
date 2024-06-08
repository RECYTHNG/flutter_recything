import 'package:dio/dio.dart';
import 'package:recything_application/models/faq/category_faq_model.dart';

class CategoryFaqService {
  final Dio dio = Dio();

  Future<CategoryFaqModel> getCategoryFaq({required String name}) async {
    try {
      var url = 'http://10.0.2.2:8080/api/v1/faqs/category?name=$name';
      var authToken =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwMSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE4MDM3NTI4fQ.g3UgMZcZAKtqmNSRVXkcJ9ak3jRD5g9siilQ1qPKjtY';

      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Authorization': 'Bearer $authToken',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return CategoryFaqModel.fromJson(response.data);
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