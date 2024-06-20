import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';

class HeaderChallengeListWidget extends StatelessWidget {
  const HeaderChallengeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChallengeDashboardController controller = Get.find();
    return Container(
      height: 125,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConstant.primaryColor500,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        border: Border.all(
          width: 0,
          color: ColorConstant.primaryColor500,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (controller.userAchievementData.value != null)
                    Image.network(
                      controller.userAchievementData.value!.data.dataUser.badge,
                      width: 25,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      controller.userAchievementData.value?.data.dataUser.point
                              .toString() ??
                          '0',
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
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
