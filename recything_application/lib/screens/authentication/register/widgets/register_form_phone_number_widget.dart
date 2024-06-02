import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/register_controller.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class RegisterFormPhoneNumberWidget extends StatelessWidget {
  const RegisterFormPhoneNumberWidget({
    super.key,
    required this.registerController,
  });

  final RegisterController registerController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomTextFieldWidget(
        label: 'Nomor Handphone',
        hint: 'Masukkan Nomor Handphone',
        hintTextColor: const Color(0xFFCBCBCB),
        isInputForPhone: true,
        controller: registerController.phoneNumberController,
        onChanged: (String value) {
          registerController.phoneNumber.value = value;
          if (value.isEmpty) {
            registerController.errorPhoneNumber.value =
                'Nomor Handphone harus diisi.';
          } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
            registerController.errorPhoneNumber.value =
                'Nomor Handphone tidak valid.';
          } else {
            registerController.errorPhoneNumber.value = null;
          }
        },
        error: registerController.errorPhoneNumber.value,
      ),
    );
  }
}
