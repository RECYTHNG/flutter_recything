import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';

class ProfileHeaderChallengeDashboardWidget extends StatelessWidget {
  const ProfileHeaderChallengeDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChallengeDashboardController controller = Get.find();
    return Obx(
      () {
        return Positioned(
          top: 55,
          left: 16,
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset(IconConstant.profileChallenge),
                SpacingConstant.horizontalSpacing100,
                if (controller.userAchievementData.value != null)
                  Text(
                    'Hello, ${controller.getFirstName()}',
                    style: TextStyleConstant.semiboldSubtitle.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  )
                else
                  Text(
                    'Hello, User',
                    style: TextStyleConstant.semiboldSubtitle.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  ),
                SpacingConstant.horizontalSpacing100,
                SvgPicture.asset(IconConstant.arrowChallenge),
              ],
            ),
          ),
        );
      },
    );
  }
}
