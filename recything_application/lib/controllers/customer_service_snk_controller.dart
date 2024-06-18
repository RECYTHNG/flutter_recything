import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/api_key_constant.dart';

class CustomerServiceSnkController extends GetxController {
  RxString snkData = ''.obs;
  var isLoading = true.obs;
  var urlTnc = tncBaseUrl;

  @override
  void onInit() {
    super.onInit();
    getSyaratDanKetentuan();
  }

  Future<void> getSyaratDanKetentuan() async {
    var url = urlTnc;
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
