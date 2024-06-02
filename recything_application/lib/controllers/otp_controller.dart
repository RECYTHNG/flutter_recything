import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/screens/authentication/login/login_screen.dart';
import 'package:recything_application/services/authentication/otp_authentication_service.dart';

class OtpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController()).obs;

  var email = ''.obs;

  void setEmail(String email) {
    this.email.value = email;
  }

  Future<void> submitOtp() async {
    if (formKey.currentState!.validate()) {
      try {
        final otp = otpControllers
            .map((e) => e.text)
            .reduce((value, element) => value + element);
        final response =
            await OneTimePasswordAuthenticationService().postOneTimePassword(
          email: email.value,
          otp: int.parse(otp),
        );
        if (response.code == 200 || response.code == 201) {
          Get.dialog(
            AlertDialog(
              title: const Text('Success'),
              content: Text(response.message ?? 'Success'),
              actions: [
                TextButton(
                  onPressed: () => Get.off(
                    () => LoginAuthenticationScreen(),
                  ),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else {
          Get.dialog(
            AlertDialog(
              title: const Text('Error'),
              content: Text(response.message ?? 'Error'),
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

  Future<void> resendOtp() async {
    try {
      final response = await OneTimePasswordAuthenticationService()
          .postResendOneTimePassword(
        email: email.value,
      );
      if (response.code == 200 || response.code == 201) {
        Get.dialog(
          AlertDialog(
            title: const Text('Success'),
            content: Text(response.message ?? 'Success'),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        Get.dialog(
          AlertDialog(
            title: const Text('Error'),
            content: Text(response.message ?? 'Error'),
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
