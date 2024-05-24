import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';

class GlobalSearchBar extends StatelessWidget {
  final String hintText;
  final Color? fillColor;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final double height;
  final double width;

  const GlobalSearchBar({
    super.key,
    required this.hintText,
    this.fillColor,
    this.controller,
    this.onChanged,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
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
          prefixIcon: const Icon(
            Icons.search,
            color: ColorConstant.netralColor900,
          ),
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