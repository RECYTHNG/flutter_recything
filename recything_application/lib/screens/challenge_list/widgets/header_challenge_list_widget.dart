import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class HeaderChallengeListWidget extends StatelessWidget {
  const HeaderChallengeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorConstant.primaryColor500,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                SvgPicture.asset('assets/icons/icon_profile.svg'),
                const SizedBox(width: 8),
                Text(
                  'Hi, User',
                  style: TextStyleConstant.semiboldSubtitle.copyWith(
                    color: ColorConstant.whiteColor,
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset('assets/icons/arrow.svg'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 43, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/mission_dashboard/gold_medal.png',
                    width: 25,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '200.000',
                    style: TextStyleConstant.semiboldHeading4.copyWith(
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Poin',
                    style: TextStyleConstant.regularParagraph.copyWith(
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
