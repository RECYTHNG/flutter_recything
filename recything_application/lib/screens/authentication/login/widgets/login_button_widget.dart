import 'package:flutter/material.dart';
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
