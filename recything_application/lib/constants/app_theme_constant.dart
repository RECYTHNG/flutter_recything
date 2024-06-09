import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';

class AppThemeConstant {
  static ThemeData appTheme = ThemeData(
    fontFamily: 'Nunito',
    highlightColor: ColorConstant.primaryColor200,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorConstant.primaryColor500,
      selectionHandleColor: ColorConstant.primaryColor500,
      selectionColor: ColorConstant.primaryColor200,
    ),
  );
}
