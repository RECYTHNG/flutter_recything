import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
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
          Get.snackbar(
            '',
            '',
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(12),
            duration: const Duration(seconds: 2),
            snackStyle: SnackStyle.FLOATING,
            backgroundColor: Colors.transparent,
            barBlur: 0.0,
            overlayBlur: 0.0,
            snackPosition: SnackPosition.BOTTOM,
            messageText: AwesomeSnackbarContent(
              title: 'Success',
              message: 'Message : ${response.message}',
              contentType: ContentType.success,
            ),
          );
          Timer(
            const Duration(seconds: 3),
            () {
              Get.off(
                () => const HomeAuthenticationScreen(),
              );
            },
          );
        } else {
          resetVariable();
          Get.snackbar(
            '',
            '',
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(12),
            snackStyle: SnackStyle.FLOATING,
            backgroundColor: Colors.transparent,
            barBlur: 0.0,
            overlayBlur: 0.0,
            snackPosition: SnackPosition.BOTTOM,
            messageText: AwesomeSnackbarContent(
              title: 'Error',
              message: 'Message : ${response.message}',
              contentType: ContentType.failure,
            ),
          );
        }
      } catch (e) {
        resetVariable();
        Get.snackbar(
          '',
          '',
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(12),
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: Colors.transparent,
          barBlur: 0.0,
          overlayBlur: 0.0,
          snackPosition: SnackPosition.BOTTOM,
          messageText: AwesomeSnackbarContent(
            title: 'Error',
            message: 'An error occurred: $e',
            contentType: ContentType.failure,
          ),
        );
      }
    }
  }
}
