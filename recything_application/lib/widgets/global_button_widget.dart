import 'package:flutter/material.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class GlobalButtonWidget extends StatelessWidget {
  final Function() onTap;
  final double width;
  final double height;
  final Color backgroundColor;
  final bool isBorder;
  final Color? borderColor;
  final String title;
  final Color textColor;
  final double fontSize;

  const GlobalButtonWidget({
    super.key,
    required this.onTap,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.isBorder,
    this.borderColor,
    required this.title,
    required this.textColor,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          border: isBorder
              ? Border.all(
                  color: borderColor ?? backgroundColor,
                  width: 1.0,
                )
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyleConstant.semiboldButton.copyWith(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
