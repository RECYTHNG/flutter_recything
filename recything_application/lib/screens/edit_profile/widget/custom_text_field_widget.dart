import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool isForm;
  final Widget? targetScreen;

  const CustomTextFieldWidget({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.isForm = true,
    this.targetScreen,
  });

  @override
  Widget build(BuildContext context) {
    Widget textField = TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: ColorConstant.netralColor600,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: ColorConstant.primaryColor500,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle:
            const TextStyle(color: ColorConstant.primaryColor500),
      ),
    );

    if (!isForm && targetScreen != null) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => targetScreen!,
            ),
          );
        },
        child: AbsorbPointer(
          child: textField,
        ),
      );
    }

    return textField;
  }
}
