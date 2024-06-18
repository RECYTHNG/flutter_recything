import 'package:get/get.dart';
import 'package:recything_application/services/homepage_service/homepage_service.dart';

class HomeController extends GetxController {
  var user = {}.obs;
  var articles = [].obs;
  var videos = [].obs;
  var leaderboard = [].obs;
  var isLoading = true.obs;

  final GetDataHomepageService _getDataHomepageService =
      GetDataHomepageService();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var data = await _getDataHomepageService.fetchHomepageData();
      user.value = data['data']['user'];
      articles.value = data['data']['articles'];
      videos.value = data['data']['videos'];
      leaderboard.value = data['data']['leaderboard'].map((item) {
        return {
          'id': item['id'] as String,
          'name': item['name'] as String,
          'picture_url': item['picture_url'] as String? ?? '',
          'point': item['point'].toString(),
          'badge': item['badge'] as String,
        };
      }).toList();
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }
}
