import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CustomerServiceSnkController extends GetxController {
  RxString snkData = ''.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getSyaratDanKetentuan();
  }

  Future<void> getSyaratDanKetentuan() async {
    var url =
        'http://ec2-54-79-237-162.ap-southeast-2.compute.amazonaws.com:8080/terms-and-conditions';
    try {
      final dio = Dio();
      final response = await dio.get(url);
      snkData.value = response.data.toString();
    } catch (e) {
      snkData.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
