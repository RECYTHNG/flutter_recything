import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_application/services/profile/profile_service.dart';
import 'package:recything_application/services/user/user_service.dart';
import 'package:recything_application/models/user/user_model.dart';

class UserController extends GetxController {
  var userModel = UserModel().obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  void fetchUser() async {
    try {
      UserModel fetchedUser = await UserService.getUser();
      userModel.value = fetchedUser;
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  void updateUserProfile(
      Map<String, dynamic> updatedData, Function onSuccess) async {
    try {
      var response = await ProfileService.putUser(updatedData);
      print("Response: ${response['message']}");
      if (response['code'] == 200) {
        fetchUser();
        onSuccess();
      } else {
        print("Error updating user profile: ${response['message']}");
      }
    } catch (e) {
      print("Error updating user profile: $e");
    }
  }

  void updateGender(String gender) {
    final updatedData = userModel.value.data!.copyWith(gender: gender);
    userModel.value = userModel.value.copyWith(data: updatedData);
  }

  void uploadAvatar(Function onSuccess) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        ProfileService profileService = ProfileService();
        var response = await profileService.uploadAvatar(image);
        print("Response: ${response.message}");
        if (response.code == 200) {
          fetchUser();
          userModel.value = response;
          onSuccess();
        } else {
          print("Error uploading avatar: ${response.message}");
        }
      }
    } catch (e) {
      print("Error uploading avatar: $e");
    }
  }
}
