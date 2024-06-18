import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';

class GlobalSearchBar extends StatelessWidget {
  final String hintText;
  final Color? fillColor;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final double height;
  final double width;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const GlobalSearchBar({
    super.key,
    required this.hintText,
    this.fillColor,
    this.controller,
    this.onChanged,
    required this.height,
    required this.width,
    this.onSubmitted,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        style: const TextStyle(
          fontSize: 14.0,
        ),
        cursorColor: ColorConstant.blackColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: ColorConstant.netralColor600,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: fillColor ?? ColorConstant.netralColor500,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
        ),
      ),
    );
  }
}
