import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/controllers/login_controller.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class LoginFormPasswordWidget extends StatelessWidget {
  const LoginFormPasswordWidget({
    super.key,
    required this.loginController,
  });

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomTextFieldWidget(
        isInputForPassword: true,
        label: 'Password',
        hint: 'Masukkan Password',
        hintTextColor: const Color(0xFFCBCBCB),
        controller: loginController.passwordController,
        obscureText: loginController.isObscurePassword.value ? false : true,
        suffixIconButton: IconButton(
          icon: Icon(
            loginController.isObscurePassword.value
                ? Icons.visibility_off
                : Icons.visibility,
            color: ColorConstant.netralColor600,
          ),
          onPressed: () {
            loginController.isObscurePassword.value =
                !loginController.isObscurePassword.value;
          },
        ),
        onChanged: (String value) {
          loginController.password.value = value;
          if (loginController.password.value.isEmpty) {
            loginController.errorPassword.value = 'Password harus diisi.';
          } else if (loginController.password.value.length < 8) {
            loginController.errorPassword.value =
                'Password minimal 8 karakter.';
          } else {
            loginController.errorPassword.value = null;
          }
        },
        error: loginController.errorPassword.value,
      ),
    );
  }
}
