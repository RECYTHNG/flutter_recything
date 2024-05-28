import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == index;
    return InkWell(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? ColorConstant.whiteColor
                : ColorConstant.netralColor500,
            size: 24,
          ),
          if (isSelected)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                label,
                style: const TextStyle(
                  color: ColorConstant.whiteColor,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
