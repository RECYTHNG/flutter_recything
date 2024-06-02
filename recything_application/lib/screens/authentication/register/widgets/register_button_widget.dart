import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/controllers/register_controller.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({
    super.key,
    required this.registerController,
  });

  final RegisterController registerController;

  @override
  Widget build(BuildContext context) {
    return GlobalButtonWidget(
      onTap: () {
        if (registerController.validation()) {
          registerController.register();
        }
      },
      width: double.infinity,
      height: 40.0,
      backgroundColor: ColorConstant.primaryColor500,
      isBorder: false,
      title: 'Register',
      textColor: ColorConstant.whiteColor,
      fontSize: 16.0,
    );
  }
}
