import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar({
  required String title,
  required String message,
  required ContentType contentType,
}) {
  Get.rawSnackbar(
    backgroundColor: Colors.transparent,
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
    messageText: AwesomeSnackbarContent(
      titleFontSize: 18,
      messageFontSize: 14,
      title: title,
      message: message,
      contentType: contentType,
    ),
  );
}
