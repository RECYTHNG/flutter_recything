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
              title: 'Login Berhasil!',
              message: 'Kamu berhasil login! Selamat Datang Kembali!',
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
        } else if (response.code == 400) {
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
              title: 'Login Gagal!',
              message: 'Format pengisian belum sesuai, silakan coba lagi',
              contentType: ContentType.failure,
            ),
          );
        } else if (response.code == 401) {
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
              title: 'Login Gagal!',
              message: 'Email atau password salah. Silakan coba lagi',
              contentType: ContentType.failure,
            ),
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
              message: response.message.toString(),
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
            message: e.toString(),
            contentType: ContentType.failure,
          ),
        );
      }
    }
  }
}
