import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_application/models/user/user_model.dart';
import 'package:recything_application/services/profile/profile_service.dart';
import 'package:recything_application/services/user/user_service.dart';

class ProfileController extends GetxController {
  final ProfileService profileService = ProfileService();
  final UserService userService = UserService();
  final ImagePicker _imagePicker = ImagePicker();
  var isLoading = false.obs;
  Rxn<Data?> userData = Rxn<Data>();
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
        var response = await profileService.postProfile(pickedImage);
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
    var response = await userService.getUser();
    try {
      if (response.code == 200) {
        userData.value = response.data;
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
