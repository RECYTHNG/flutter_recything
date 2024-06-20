import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/utils/shared_pref.dart';

class LeaderboardController extends GetxController {
  final Dio dio = Dio();
  var baseUrl = recythingBaseUrl;
  var leaderboardList = <Map<String, String>>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLeaderboard();
  }

  Future<void> fetchLeaderboard() async {
    isLoading(true);
    try {
      var url = '$baseUrl/leaderboard';
      String? authToken = await SharedPref.getToken();
      if (authToken == null) {
        throw Exception('Tidak ada token yang ditemukan');
      }
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':
                'Bearer $authToken',
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = response.data['data'] as List;
        leaderboardList.value = data.map((item) {
          return {
            'id': item['id'] as String,
            'name': item['name'] as String,
            'picture_url': item['picture_url'] as String? ?? '',
            'point': item['point'].toString(),
            'badge': item['badge'] as String,
          };
        }).toList();
      } else {
        throw Exception('Failed to get response from API');
      }
    } on DioException catch (e) {
      throw Exception('Failed to get response from API: ${e.message}');
    } finally {
      isLoading(false);
    }
  }
}
