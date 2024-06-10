import 'package:get/get.dart';
import 'package:recything_application/models/about_us/about_us_model.dart';
import 'package:recything_application/services/about_us/about_us_service.dart';

class AboutUsController extends GetxController {
  final AboutUsService aboutUsService = AboutUsService();
  RxBool isLoading = false.obs;
  Rxn<AboutUsModel> aboutUsData = Rxn<AboutUsModel>();
  RxString param = "perusahaan".obs;
  RxInt index = 0.obs;

  @override
  void onInit() {
    getAboutUs(param.value);
    super.onInit();
  }

  void getAboutUs(String param) async {
    isLoading.value = true;
    var response = await aboutUsService.getAboutUs(param);
    try {
      if (response.code == 200) {
        aboutUsData.value = response;
      } else {
        Get.snackbar(
          "Error",
          response.message.toString(),
        );
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred : $e");
    } finally {
      isLoading.value = false;
    }
  }
}
