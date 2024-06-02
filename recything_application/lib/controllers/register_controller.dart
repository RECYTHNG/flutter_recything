import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/screens/authentication/on_time_password/one_time_password_screen.dart';
import 'package:recything_application/services/authentication/register_authentication_service.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  var errorName = RxnString();
  var errorEmail = RxnString();
  var errorPassword = RxnString();

  var isObscurePassword = false.obs;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void resetVariable() {
    name.value = '';
    email.value = '';
    password.value = '';
    errorName.value = null;
    errorEmail.value = null;
    errorPassword.value = null;
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  bool validation() {
    return name.value != '' &&
        email.value != '' &&
        password.value != '' &&
        name.value.isNotEmpty &&
        email.value.isNotEmpty &&
        password.value.isNotEmpty;
  }

  Future<void> register() async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        final response = await RegisterAuthenticationService().postRegister(
          name: name.value,
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
              Get.to(
                () => OneTimePasswordAuthenticationScreen(
                  email: email.value,
                ),
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
