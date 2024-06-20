import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';
import 'package:recything_application/screens/achievement_screen/achievement_screen.dart';
import 'package:recything_application/screens/challenge/challenge_list/challenge_list_screen.dart';
import 'package:recything_application/screens/halaman_riwayat/point_history_screen.dart';
import 'package:recything_application/utils/user_level_utils.dart';

class CardHeaderMissionDashboardWidget extends StatelessWidget {
  const CardHeaderMissionDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChallengeDashboardController controller = Get.find();
    return Obx(
      () {
        return Container(
          margin: const EdgeInsets.only(
            top: 160,
            right: 17,
            left: 17,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 23,
            horizontal: 18,
          ),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: ColorConstant.primaryColor400,
            borderRadius: BorderRadius.all(
              Radius.circular(11),
            ),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Poin',
                    style: TextStyleConstant.semiboldCaption.copyWith(
                      color: ColorConstant.netralColor50,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const AchievementScreen()),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 17,
                      ),
                      height: 29,
                      decoration: BoxDecoration(
                        color: const Color(0xffEFEFEF),
                        border: Border.all(
                          width: 1,
                          color: ColorConstant.primaryColor500,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(11),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (controller.userAchievementData.value != null)
                            Image.network(
                              controller
                                  .userAchievementData.value!.data.dataUser.badge,
                            ),
                          SpacingConstant.horizontalSpacing050,
                          Text(
                            controller.userAchievementData.value?.data != null
                                ? UserLevelUtils.getLevel(controller
                                    .userAchievementData
                                    .value!
                                    .data
                                    .dataUser
                                    .point)
                                : 'Classic',
                            style: TextStyleConstant.semiboldCaption.copyWith(
                              color: ColorConstant.primaryColor500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SpacingConstant.verticalSpacing100,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    controller.userAchievementData.value?.data.dataUser.point
                            .toString() ??
                        '0',
                    style: TextStyleConstant.semiboldHeading3.copyWith(
                      color: ColorConstant.netralColor50,
                    ),
                  )
                ],
              ),
              SpacingConstant.verticalSpacing200,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.to(() => const ChallengeListScreen()),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 11,
                          horizontal: 30,
                        ),
                        decoration: const BoxDecoration(
                          color: ColorConstant.primaryColor500,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Tambah Poin',
                            style: TextStyleConstant.semiboldParagraph.copyWith(
                              color: ColorConstant.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SpacingConstant.horizontalSpacing100,
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.to(() => PointHisstoryScreen()),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 11,
                          horizontal: 30,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          border: Border.all(
                            color: ColorConstant.primaryColor500,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Riwayat',
                            style: TextStyleConstant.semiboldParagraph.copyWith(
                              color: ColorConstant.primaryColor500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
