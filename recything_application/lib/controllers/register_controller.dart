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
  var isLoading = false.obs;

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
      isLoading(true);
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
              title: 'Pendaftaran Berhasil',
              message: 'Pengguna berhasil mendaftar! OTP dikirim ke email Anda',
              contentType: ContentType.success,
            ),
          );

          Get.to(
            () => OneTimePasswordAuthenticationScreen(
              email: email.value,
            ),
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
              title: 'Pendaftaran Gagal!',
              message: 'Format pengisian belum sesuai, silakan coba lagi',
              contentType: ContentType.failure,
            ),
          );
        } else if (response.code == 409) {
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
              title: 'Pendaftaran Gagal!',
              message:
                  'Email sudah dipakai! Silahkan login atau gunakan email lain!',
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
      } finally {
        isLoading(false);
      }
    }
  }
}
