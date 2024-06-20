import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class BottomNavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final int index;
  final int currentIndex;
  final Function(int) onTap;
  final bool isSvg;

  const BottomNavItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    this.isSvg = false,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: isSelected ? 1.0 : 0.7,
            child: isSvg
                ? SvgPicture.asset(
                    iconPath,
                    width: 24,
                    height: 24,
                    color: isSelected
                        ? ColorConstant.whiteColor
                        : ColorConstant.netralColor500,
                  )
                : Icon(
                    IconData(int.parse(iconPath), fontFamily: 'MaterialIcons'),
                    color: isSelected
                        ? ColorConstant.whiteColor
                        : ColorConstant.netralColor500,
                    size: 24,
                  ),
          ),
          if (isSelected)
            Text(label,
                style: TextStyleConstant.regularCaption.copyWith(
                  color: ColorConstant.whiteColor,
                )),
        ],
      ),
    );
  }
}
