import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/register_controller.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class RegisterFormNameWidget extends StatelessWidget {
  const RegisterFormNameWidget({
    super.key,
    required this.registerController,
  });

  final RegisterController registerController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomTextFieldWidget(
        label: 'Nama',
        hint: 'Masukkan Nama Lengkap',
        hintTextColor: const Color(0xFFCBCBCB),
        controller: registerController.nameController,
        onChanged: (String value) {
          registerController.name.value = value;
          if (value.isEmpty) {
            registerController.errorName.value = 'Nama harus diisi oleh user.';
          } else if (RegExp(r'[0-9!@#%^&*(),.?":{}|<>]').hasMatch(value)) {
            registerController.errorName.value =
                'Nama tidak boleh mengandung angka atau karakter spesial.';
          } else {
            registerController.errorName.value = null;
          }
        },
        error: registerController.errorName.value,
      ),
    );
  }
}
