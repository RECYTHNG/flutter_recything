import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_application/services/profile/profile_service.dart';
import 'package:recything_application/services/user/user_service.dart';
import 'package:recything_application/models/user/user_model.dart';
import 'package:recything_application/widgets/global_image_picker_dialog_widget.dart';

class UserController extends GetxController {
  var userModel = UserModel().obs;
  var isLoading = false.obs;
  var name = ''.obs;
  var gender = ''.obs;
  var birthDate = ''.obs;
  var email = ''.obs;
  var address = ''.obs;

  ProfileService profileService = ProfileService();
  UserService userService = UserService();

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  void fetchUser() async {
    try {
      UserModel fetchedUser = await userService.getUser();
      userModel.value = fetchedUser;

      name.value = fetchedUser.data?.name ?? '';
      gender.value = fetchedUser.data?.gender ?? '';
      birthDate.value =
          fetchedUser.data?.birthDate?.toIso8601String().split('T')[0] ?? '';
      email.value = fetchedUser.data?.email ?? '';
      address.value = fetchedUser.data?.address ?? '';
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching user data: $e");
      }
    }
  }

  void updateUserProfile(Function onSuccess) async {
    try {
      var updatedData = {
        'name': name.value,
        'email': email.value,
        'address': address.value,
        'gender': gender.value,
        'birth_date': birthDate.value,
      };
      var response = await profileService.putUser(updatedData);
      if (response['code'] == 200) {
        fetchUser();
        onSuccess();
      } else {
        _showSnackbar(
            title: 'Error',
            message: response['message'],
            contentType: ContentType.failure);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error updating user profile: $e");
      }
    }
  }

  void updateGender(String newGender) {
    gender.value = newGender;
  }

  Future<void> showImageSourceDialog(
      Function(ImageSource) onImageSourceSelected) async {
    return Get.dialog(GlobalImagePickerDialogWidget(
        onImageSourceSelected: onImageSourceSelected));
  }

  Future<void> pickImage(ImageSource source) async {
    isLoading.value = true;
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);

      if (image != null) {
        var response = await profileService.uploadAvatar(image);
        if (response.code == 200) {
          fetchUser();
        } else {
          if (kDebugMode) {
            print("Error uploading avatar: ${response.message}");
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error uploading avatar: $e");
      }
    } finally {
      isLoading.value = false;
    }
  }
}

void _showSnackbar({
  required String title,
  required String message,
  required ContentType contentType,
}) {
  Get.rawSnackbar(
    backgroundColor: Colors.transparent,
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
    messageText: AwesomeSnackbarContent(
      titleFontSize: 18,
      messageFontSize: 14,
      title: title,
      message: message,
      contentType: contentType,
    ),
  );
}
