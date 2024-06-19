import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/controllers/register_controller.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class RegisterFormPasswordWidget extends StatelessWidget {
  const RegisterFormPasswordWidget({
    super.key,
    required this.registerController,
  });

  final RegisterController registerController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomTextFieldWidget(
        isInputForPassword: true,
        label: 'Password',
        hint: 'Masukkan Password',
        hintTextColor: const Color(0xFFCBCBCB),
        controller: registerController.passwordController,
        obscureText: registerController.isObscurePassword.value ? false : true,
        suffixIconButton: IconButton(
          icon: Icon(
            registerController.isObscurePassword.value
                ? Icons.visibility_off
                : Icons.visibility,
            color: ColorConstant.netralColor600,
          ),
          onPressed: () {
            registerController.isObscurePassword.value =
                !registerController.isObscurePassword.value;
          },
        ),
        onChanged: (String value) {
          registerController.password.value = value;
          if (value.isEmpty) {
            registerController.errorPassword.value = 'Password harus diisi.';
          } else if (registerController.password.value.length < 8) {
            registerController.errorPassword.value =
                'Password minimal 8 karakter.';
          } else {
            registerController.errorPassword.value = null;
          }
        },
        error: registerController.errorPassword.value,
      ),
    );
  }
}