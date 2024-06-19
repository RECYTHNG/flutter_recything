import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_application/models/user/user_model.dart';
import 'package:recything_application/screens/profile/widget/snackbar_widget.dart';
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
    isLoading.value = true;
    try {
      XFile? pickedImage = await _imagePicker.pickImage(source: imageSource);
      if (pickedImage != null) {
        var response = await profileService.postProfile(pickedImage);
        if (response.code == 200) {
          showSnackbar(
            title: "Succes",
            message: response.message.toString(),
            contentType: ContentType.success,
          );
          getImageFromAPi();
        } else {
          showSnackbar(
            title: "Error",
            message: response.message.toString(),
            contentType: ContentType.failure,
          );
        }
      } else {
        showSnackbar(
          title: "Error",
          message: "No Image Selected",
          contentType: ContentType.failure,
        );
      }
    } catch (e) {
      showSnackbar(
        title: "Error",
        message: "An error occurred",
        contentType: ContentType.failure,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void getImageFromAPi() async {
    isLoading.value = true;
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
      isLoading.value = false;
    }
  }
}
