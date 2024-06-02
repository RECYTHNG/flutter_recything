import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/shadow_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class MissionStepWidget extends StatelessWidget {
  final int index;
  final String title;
  final String description;
  final String progress;

  const MissionStepWidget({
    super.key,
    required this.index,
    required this.title,
    required this.description,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: progress == 'done'
            ? ColorConstant.successColor50
            : ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: ShadowConstant.shadowMd,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: ColorConstant.netralColor900,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyleConstant.boldParagraph.copyWith(
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyleConstant.semiboldSubtitle,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 8),
                  width: 300,
                  child: Text(
                    description,
                    style: TextStyleConstant.regularCaption,
                  ),
                ),
                SvgPicture.asset(progress == 'done'
                    ? IconConstant.iconStatusDone
                    : IconConstant.iconStatusProcess),
              ],
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
