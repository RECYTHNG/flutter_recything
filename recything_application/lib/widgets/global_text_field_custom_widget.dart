import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool isForm;
  final Widget? targetScreen;
  final bool isEnable;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final String? error;
  final bool isInputForPhone;
  final Color? labelColor;
  final double? labelFontSize;
  final Color? floatingLabelColor;
  final FontWeight? labelFontWeight;
  final Color? hintTextColor;
  final double? hintFontSize;
  final FontWeight? hintFontWeight;
  final bool isInputForPassword;
  final IconButton? suffixIconButton;
  final bool obscureText;
  final bool isTextArea;
  final bool isFloatingLabel;

  const CustomTextFieldWidget({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.isForm = true,
    this.targetScreen,
    this.isEnable = true,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.error,
    this.isInputForPhone = false,
    this.labelFontSize,
    this.labelColor,
    this.floatingLabelColor,
    this.labelFontWeight,
    this.hintTextColor,
    this.hintFontSize,
    this.hintFontWeight,
    this.isInputForPassword = false,
    this.suffixIconButton,
    this.obscureText = false,
    this.isTextArea = false,
    this.isFloatingLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget textField = TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      style: TextStyleConstant.regularParagraph.copyWith(
        fontSize: 14.0,
        color: ColorConstant.primaryColor900,
        fontWeight: FontWeight.w400,
      ),
      keyboardType: isInputForPhone ? TextInputType.phone : TextInputType.text,
      inputFormatters: [
        if (isInputForPhone) ...[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(13),
        ]
      ],
      maxLines: isTextArea ? null : 1,
      minLines: isTextArea ? 5 : null,
      decoration: InputDecoration(
        errorText: error,
        enabled: isEnable,
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
        //label
        labelText: label,
        floatingLabelBehavior: isFloatingLabel
            ? FloatingLabelBehavior.always
            : FloatingLabelBehavior.never,
        floatingLabelStyle: TextStyleConstant.semiboldCaption.copyWith(
          color: floatingLabelColor ?? ColorConstant.primaryColor500,
          fontWeight: labelFontWeight ?? FontWeight.w600,
          fontSize: labelFontSize ?? 14.0,
        ),
        labelStyle: TextStyleConstant.semiboldCaption.copyWith(
          color: labelColor ?? ColorConstant.netralColor600,
          fontWeight: labelFontWeight ?? FontWeight.w600,
          fontSize: labelFontSize ?? 14.0,
        ),
        //hint
        hintText: hint,
        hintStyle: TextStyleConstant.regularParagraph.copyWith(
          color: hintTextColor ?? ColorConstant.netralColor600,
          fontSize: hintFontSize ?? 14.0,
          fontWeight: hintFontWeight ?? FontWeight.w400,
        ),
        suffixIcon: isInputForPassword ? suffixIconButton : null,
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
