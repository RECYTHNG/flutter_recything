import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_application/services/profile/profile_service.dart';
import 'package:recything_application/services/user/user_service.dart';

class ProfileController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();
  var isLoading = false.obs;
  var image = ''.obs;
  @override
  void onInit() {
    getImageFromAPi();
    super.onInit();
  }

  void uploadAndgetImage(ImageSource imageSource) async {
    try {
      XFile? pickedImage = await _imagePicker.pickImage(source: imageSource);
      isLoading(true);
      if (pickedImage != null) {
        var response = await ProfileService.postProfile(pickedImage);
        if (response.code == 200) {
          Get.snackbar(
            "Success",
            response.message.toString(),
          );
          getImageFromAPi();
        } else {
          Get.snackbar(
            "Error",
            response.message.toString(),
          );
        }
      } else {
        Get.snackbar("Error", "No Image Selected");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred : $e");
    } finally {
      isLoading(false);
    }
  }

  void getImageFromAPi() async {
    isLoading(true);
    var response = await UserService.getUser();
    try {
      if (response.code == 200) {
        image.value = response.data!.pictureUrl.toString();
        // Get.snackbar(
        //   "Success",
        //   response.message.toString(),
        // );
      } else {
        Get.snackbar(
          "Error",
          response.message.toString(),
        );
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred : $e");
    } finally {
      isLoading(false);
    }
  }
}
