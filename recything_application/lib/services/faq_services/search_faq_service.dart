import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/models/faq/search_faq_model.dart';

class SearchFaqService {
  final Dio dio = Dio();
  var baseUrl = recythingBaseUrl;

  Future<SearchCustomerServiceModel> getSearchFaq(
      {required String query}) async {
    try {
      var url = '$baseUrl/faqs/search?keyword=$query';
      var authToken =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAwNCIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzE4NTAzNjA2fQ._r8eWZoSOaFWHldXmM0VQzEVq96yUhavUQnqKKm3ZYM';

      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Authorization': 'Bearer $authToken',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return SearchCustomerServiceModel.fromJson(response.data);
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
