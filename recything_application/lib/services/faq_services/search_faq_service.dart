import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/controllers/global_controller.dart';
import 'package:recything_application/models/faq/search_faq_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class SearchFaqService {
  final Dio dio = Dio();
  var baseUrl = recythingBaseUrl;

  Future<SearchCustomerServiceModel> getSearchFaq(
      {required String query}) async {
    try {
      var url = '$baseUrl/faqs/search?keyword=$query';
      String? authToken = await SharedPref.getToken();
      if (authToken == null) {
        throw Exception('Tidak ada token yang ditemukan');
      }

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
      if (e.response?.statusCode == 401) {
        Get.find<GlobalController>().showExpiredSessionDialog();
      }
      throw Exception('Failed to load FAQs: ${e.error}');
    }
  }
}
