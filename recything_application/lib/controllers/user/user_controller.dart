import 'package:get/get.dart';
import 'package:recything_application/services/profile/profile_service.dart';
import 'package:recything_application/services/user/user_service.dart';
import 'package:recything_application/models/user/user_model.dart';

class UserController extends GetxController {
  var userModel = UserModel().obs;

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

  void updateUserProfile(Map<String, dynamic> updatedData) async {
    try {
      var response = await ProfileService.putUser(updatedData);
      print("Response: ${response['message']}");
      if (response['code'] == 200) {
        fetchUser();
      } else {
        print("Error updating user profile: ${response['message']}");
      }
    } catch (e) {
      print("Error updating user profile: $e");
    }
  }
}
