import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/screens/authentication/on_time_password/one_time_password_screen.dart';
import 'package:recything_application/services/authentication/register_authentication_service.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var name = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var password = ''.obs;

  var errorName = RxnString();
  var errorEmail = RxnString();
  var errorPhoneNumber = RxnString();
  var errorPassword = RxnString();

  var isObscurePassword = false.obs;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void resetVariable() {
    name.value = '';
    email.value = '';
    phoneNumber.value = '';
    password.value = '';
    errorName.value = null;
    errorEmail.value = null;
    errorPhoneNumber.value = null;
    errorPassword.value = null;
    nameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
  }

  bool validation() {
    return name.value != '' &&
        email.value != '' &&
        phoneNumber.value != '' &&
        password.value != '' &&
        name.value.isNotEmpty &&
        email.value.isNotEmpty &&
        phoneNumber.value.isNotEmpty &&
        password.value.isNotEmpty;
  }

  Future<void> register() async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        final response = await RegisterAuthenticationService().postRegister(
          name: name.value,
          email: email.value,
          phoneNumber: phoneNumber.value,
          password: password.value,
        );

        if (response.code == 200 || response.code == 201) {
          Get.dialog(
            AlertDialog(
              title: const Text('Success'),
              content: Text(
                response.message ?? 'Registration success!',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.to(
                      () => OneTimePasswordAuthenticationScreen(
                        email: email.value,
                      ),
                    );
                  },
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
