import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/register_controller.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class RegisterFormEmailWidget extends StatelessWidget {
  const RegisterFormEmailWidget({
    super.key,
    required this.registerController,
  });

  final RegisterController registerController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomTextFieldWidget(
        label: 'Email',
        hint: 'Masukkan Email',
        hintTextColor: const Color(0xFFCBCBCB),
        controller: registerController.emailController,
        onChanged: (String value) {
          registerController.email.value = value;
          if (value.isEmpty) {
            registerController.errorEmail.value = 'Email harus harus diisi.';
          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
              .hasMatch(value)) {
            registerController.errorEmail.value = 'Email tidak valid.';
          } else {
            registerController.errorEmail.value = null;
          }
        },
        error: registerController.errorEmail.value,
      ),
    );
  }
}
