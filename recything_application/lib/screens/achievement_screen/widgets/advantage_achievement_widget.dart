import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class AdvantagesAchievementWidget extends StatelessWidget {
  final String advantagePercent;
  final Widget svgIcon;
  const AdvantagesAchievementWidget({
    super.key,
    required this.advantagePercent,
    required this.svgIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Keuntungan',
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor900,
          ),
        ),
        SpacingConstant.verticalSpacing100,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 52.0,
                  width: 52.0,
                  decoration: const BoxDecoration(
                    color: Color(
                      0xFF4F3415,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: svgIcon,
                  ),
                ),
                SpacingConstant.horizontalSpacing200,
                Text(
                  'Dapatkan Bonus Poin $advantagePercent dari \nmissions yang kamu selesaikan',
                  style: TextStyleConstant.mediumCaption
                      .copyWith(color: ColorConstant.netralColor900),
                )
              ],
            ),
            SpacingConstant.verticalSpacing100,
            Row(
              children: [
                Container(
                  height: 52.0,
                  width: 52.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4F3415),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(12.0), child: svgIcon),
                ),
                SpacingConstant.horizontalSpacing200,
                Text(
                  'Dapatkan Bonus Poin $advantagePercent dari \nmissions yang kamu selesaikan',
                  style: TextStyleConstant.mediumCaption
                      .copyWith(color: ColorConstant.netralColor900),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
