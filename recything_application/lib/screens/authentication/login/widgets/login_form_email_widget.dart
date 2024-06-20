import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/login_controller.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class LoginFormEmailWidget extends StatelessWidget {
  const LoginFormEmailWidget({
    super.key,
    required this.loginController,
  });

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomTextFieldWidget(
        label: 'Email',
        hint: 'Masukkan Email',
        hintTextColor: const Color(0xFFCBCBCB),
        controller: loginController.emailController,
        onChanged: (String value) {
          loginController.email.value = value;
          if (value.isEmpty) {
            loginController.errorEmail.value = 'Email atau harus diisi.';
          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
              .hasMatch(value)) {
            loginController.errorEmail.value = 'Email tidak valid.';
          } else {
            loginController.errorEmail.value = null;
          }
        },
        error: loginController.errorEmail.value,
      ),
    );
  }
}
