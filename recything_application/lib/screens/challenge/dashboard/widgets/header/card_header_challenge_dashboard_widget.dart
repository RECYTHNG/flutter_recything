import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';

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
                  Container(
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
                        // Image.asset(
                        //   'assets/images/challenge_dashboard/gold_medal.png',
                        // ),
                        if (controller.userAchievementData.value != null)
                          Image.network(controller.userAchievementData.value!.data.dataUser.badge),
                        
                        // Image.network(controller.userAchievementData.value.data.dataUser.badge),
                        SpacingConstant.horizontalSpacing050,
                        Text(
                          // toBeginningOfSentenceCase(controller
                          //         .userAchievementData
                          //         .value
                          //         ?.data
                          //         .dataUser
                          //         .badge) ??
                          //     'Badge',
                          'Classic',
                          style: TextStyleConstant.semiboldCaption.copyWith(
                            color: ColorConstant.primaryColor500,
                          ),
                        ),
                      ],
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
                    child: InkWell(
                      onTap: () {},
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
                    child: InkWell(
                      onTap: () {},
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
