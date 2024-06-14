import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';

class DotAnimationWidget extends StatelessWidget {
  final bool isActive;
  const DotAnimationWidget({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 8.0,
          width: 8.0,
          decoration: BoxDecoration(
            color: isActive
                ? ColorConstant.primaryColor500
                : ColorConstant.netralColor600,
            borderRadius: BorderRadius.circular(4.0),
          )),
    );
  }
}
