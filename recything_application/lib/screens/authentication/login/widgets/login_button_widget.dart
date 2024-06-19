import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/controllers/login_controller.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.loginController,
  });

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return GlobalButtonWidget(
      onTap: () {
        if (loginController.validation()) {
          loginController.login();
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
              title: 'Gagal',
              message: 'Silakan isi form terlebih dahulu',
              contentType: ContentType.failure,
            ),
          );
        }
      },
      width: double.infinity,
      height: 40.0,
      backgroundColor: ColorConstant.primaryColor500,
      isBorder: false,
      title: 'Login',
      textColor: ColorConstant.whiteColor,
      fontSize: 16.0,
    );
  }
}
