import 'package:get/get.dart';
import 'package:recything_application/models/user/user_model.dart';
import 'package:recything_application/services/user/user_service.dart';

class UserController extends GetxController {
  var userModel = UserModel().obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

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
}
