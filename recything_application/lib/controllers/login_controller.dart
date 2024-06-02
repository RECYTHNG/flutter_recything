import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/screens/home.dart';
import 'package:recything_application/services/authentication/login_authentication_service.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var email = ''.obs;
  var password = ''.obs;

  var errorEmail = RxnString();
  var errorPassword = RxnString();

  var isObscurePassword = false.obs;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void resetVariable() {
    email.value = '';
    password.value = '';
    errorEmail.value = null;
    errorPassword.value = null;
    emailController.clear();
    passwordController.clear();
  }

  bool validation() {
    return email.value != '' &&
        password.value != '' &&
        email.value.isNotEmpty &&
        password.value.isNotEmpty;
  }

  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        final response = await LoginAuthenticationService().postLogin(
          email: email.value,
          password: password.value,
        );
        if (response.code == 200 || response.code == 201) {
          Get.dialog(
            AlertDialog(
              title: const Text('Success'),
              content: Text(
                response.message ?? 'Login success!',
              ),
              actions: [
                TextButton(
                  onPressed: () => Get.off(
                    () => const HomeAuthenticationScreen(),
                  ),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else {
          resetVariable();
          Get.dialog(
            AlertDialog(
              title: const Text('Error'),
              content: Text(response.message ?? 'Unknown error'),
              actions: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        resetVariable();
        Get.dialog(
          AlertDialog(
            title: const Text('Error'),
            content: Text('An error occurred: $e'),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }
}
