import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
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
                () => LoginAuthenticationScreen(),
              );
            },
          );
        } else {
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

  Future<void> resendOtp() async {
    try {
      final response = await OneTimePasswordAuthenticationService()
          .postResendOneTimePassword(
        email: email.value,
      );
      if (response.code == 200 || response.code == 201) {
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
            title: 'Success',
            message: 'Message : ${response.message}',
            contentType: ContentType.success,
          ),
        );
      } else {
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