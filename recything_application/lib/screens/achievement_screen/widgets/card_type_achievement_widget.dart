import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/achievement_controller.dart';

class CardTypeAchievementWidget extends StatelessWidget {
  const CardTypeAchievementWidget({
    super.key,
    required this.levelPoint,
    required this.achievementController,
    required this.targetPoint,
    required this.color1,
    required this.color2,
    required this.typeAchievement,
    required this.desc,
  });

  final int levelPoint;
  final AchievementController achievementController;
  final int targetPoint;
  final Color color1;
  final Color color2;
  final String typeAchievement;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200.0,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: SweepGradient(
              colors: [
                color1,
                color2,
              ],
              center: const Alignment(-2.5, 0.0),
              startAngle: 0.0,
              endAngle: 2 * 3.14159,
              transform: const GradientRotation(-3.14 / 3),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  typeAchievement,
                  style: TextStyleConstant.semiboldHeading4.copyWith(
                    fontSize: 18.0,
                    color: ColorConstant.whiteColor,
                  ),
                ),
                SpacingConstant.verticalSpacing100,
                Text(
                  desc,
                  style: TextStyleConstant.regularParagraph.copyWith(
                    color: ColorConstant.whiteColor.withOpacity(0.6),
                  ),
                ),
                SpacingConstant.verticalSpacing100,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Poin Dibutuhkan',
                      style: TextStyleConstant.regularParagraph.copyWith(
                        color: ColorConstant.whiteColor,
                      ),
                    ),
                    Text(
                      '$levelPoint Poin',
                      style: TextStyleConstant.semiboldTitle.copyWith(
                        color: ColorConstant.whiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0.0,
          child: Image.asset(
            ImageConstant.cardImage,
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            height: 48.0,
            decoration: BoxDecoration(
              color: ColorConstant.blackColor.withOpacity(0.25),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                achievementController.achievementResult.value.data != null &&
                        achievementController
                                .achievementResult.value.data!.dataUser !=
                            null &&
                        achievementController.achievementResult.value.data!
                                .dataUser!.point! >=
                            targetPoint
                    ? SvgPicture.asset(
                        width: 18.01,
                        height: 24,
                        IconConstant.unlockAchievement,
                      )
                    : achievementController
                                    .achievementResult.value.data !=
                                null &&
                            achievementController
                                    .achievementResult.value.data!.dataUser !=
                                null &&
                            achievementController.achievementResult.value.data!
                                    .dataUser!.point! <
                                levelPoint
                        ? SvgPicture.asset(
                            width: 18.01,
                            height: 24,
                            IconConstant.lockAchievement,
                          )
                        : SvgPicture.asset(
                            width: 18.01,
                            height: 24,
                            IconConstant.achievementIcon,
                          ),
                SpacingConstant.horizontalSpacing100,
                Text(
                  achievementController.achievementResult.value.data != null &&
                          achievementController
                                  .achievementResult.value.data!.dataUser !=
                              null &&
                          achievementController.achievementResult.value.data!
                                  .dataUser!.point! >=
                              targetPoint
                      ? 'Lencana ini sudah kamu dapatkan'
                      : achievementController
                                      .achievementResult.value.data !=
                                  null &&
                              achievementController
                                      .achievementResult.value.data!.dataUser !=
                                  null &&
                              achievementController.achievementResult.value
                                      .data!.dataUser!.point! <
                                  levelPoint
                          ? 'Poin Kamu Belum Cukup'
                          : 'Level Lencana Anda Saat Ini',
                  style: TextStyleConstant.regularParagraph.copyWith(
                    color: ColorConstant.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
