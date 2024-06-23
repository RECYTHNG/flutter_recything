import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class CustomPointWidget extends StatelessWidget {
  final String pointChallenge;
  final double width;
  final double height;

  const CustomPointWidget({
    super.key,
    required this.pointChallenge,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            IconConstant.iconPoint,
            height: height,
          ),
          const SizedBox(width: 4),
          Text(
            pointChallenge,
            style: TextStyleConstant.semiboldCaption.copyWith(color: const Color(0xFF1554C2)),
          ),
        ],
      ),
    );
  }
}
