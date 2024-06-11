import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/achievement_controller.dart';
import 'package:recything_application/screens/achievement_screen/widgets/advantage_achievement_widget.dart';
import 'package:recything_application/screens/achievement_screen/widgets/list_point_addition_history_widget.dart';

class GoldAchievementContent extends StatelessWidget {
  GoldAchievementContent({super.key});

  final AchievementController achievementController = Get.put(
    AchievementController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () {
            int currentPoint = achievementController
                    .achievementResult.value.data?.dataUser?.point ??
                0;
            int levelPoint = achievementController.achievementResult.value.data
                    ?.dataAchievement?[1].targetPoint ??
                0;
            int targetPoint = achievementController.achievementResult.value.data
                    ?.dataAchievement?[2].targetPoint ??
                0;
            double progressValue =
                (targetPoint > 0) ? currentPoint / targetPoint : 0;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: SweepGradient(
                          colors: [
                            const Color(0xFFD4AF35),
                            const Color(0xFFD4AF35).withOpacity(0.95),
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
                              'Gold',
                              style:
                                  TextStyleConstant.semiboldHeading4.copyWith(
                                fontSize: 18.0,
                                color: ColorConstant.whiteColor,
                              ),
                            ),
                            SpacingConstant.verticalSpacing100,
                            Text(
                              'Langkah besar untuk lingkungan yang \nlebih segar dan masa depan yang cerah.',
                              style:
                                  TextStyleConstant.regularParagraph.copyWith(
                                color:
                                    ColorConstant.whiteColor.withOpacity(0.6),
                              ),
                            ),
                            SpacingConstant.verticalSpacing100,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Poin Dibutuhkan',
                                  style: TextStyleConstant.regularParagraph
                                      .copyWith(
                                    color: ColorConstant.whiteColor,
                                  ),
                                ),
                                Text(
                                  '$levelPoint Poin',
                                  style:
                                      TextStyleConstant.semiboldTitle.copyWith(
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
                            achievementController
                                            .achievementResult.value.data !=
                                        null &&
                                    achievementController.achievementResult
                                            .value.data!.dataUser !=
                                        null &&
                                    achievementController.achievementResult
                                            .value.data!.dataUser!.point! >=
                                        targetPoint
                                ? SvgPicture.asset(
                                    width: 18.01,
                                    height: 24,
                                    IconConstant.unlockAchievement,
                                  )
                                : achievementController
                                                .achievementResult.value.data !=
                                            null &&
                                        achievementController.achievementResult
                                                .value.data!.dataUser !=
                                            null &&
                                        achievementController.achievementResult
                                                .value.data!.dataUser!.point! <=
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
                              achievementController
                                              .achievementResult.value.data !=
                                          null &&
                                      achievementController.achievementResult
                                              .value.data!.dataUser !=
                                          null &&
                                      achievementController.achievementResult
                                              .value.data!.dataUser!.point! >=
                                          targetPoint
                                  ? 'Lencana ini sudah kamu dapatkan'
                                  : achievementController
                                                  .achievementResult.value.data !=
                                              null &&
                                          achievementController
                                                  .achievementResult
                                                  .value
                                                  .data!
                                                  .dataUser !=
                                              null &&
                                          achievementController
                                                  .achievementResult
                                                  .value
                                                  .data!
                                                  .dataUser!
                                                  .point! <=
                                              levelPoint
                                      ? 'Poin Kamu Belum Cukup'
                                      : 'Level Lencana Anda Saat Ini',
                              style:
                                  TextStyleConstant.regularParagraph.copyWith(
                                color: ColorConstant.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SpacingConstant.verticalSpacing200,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jumlah Point Kamu Saat Ini',
                      style: TextStyleConstant.boldParagraph.copyWith(
                        color: ColorConstant.netralColor700,
                      ),
                    ),
                    Text(
                      '$currentPoint Poin',
                      style: TextStyleConstant.boldHeading4.copyWith(
                        fontSize: 20.0,
                        color: ColorConstant.netralColor900,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SpacingConstant.verticalSpacing100,
                    LinearProgressIndicator(
                      minHeight: 8.0,
                      value: progressValue,
                      backgroundColor: ColorConstant.netralColor500,
                      borderRadius: BorderRadius.circular(40.0),
                      color: const Color(0xFFD4AF35),
                    ),
                    SpacingConstant.verticalSpacing100,
                    Text(
                      currentPoint >= targetPoint
                          ? 'Poin kamu sudah melewati batas level lencana ini'
                          : currentPoint <= levelPoint
                              ? 'Poin kamu belum cukup untuk level lencana ini'
                              : '${targetPoint - currentPoint} Poin lagi untuk kamu menjadi level platinum',
                      style: TextStyleConstant.mediumCaption.copyWith(
                        color: ColorConstant.netralColor600,
                      ),
                    ),
                  ],
                ),
                SpacingConstant.verticalSpacing100,
                const Divider(
                  color: Color(0xFFE6E6E6),
                ),
                SpacingConstant.verticalSpacing100,
                ListPointAdditionHistoryWidget(
                  achievementController: achievementController,
                ),
                SpacingConstant.verticalSpacing200,
                AdvantagesAchievementWidget(
                  advantagePercent: '20%',
                  svgIcon: SvgPicture.asset(
                    IconConstant.poinkuGoldAchievement,
                  ),
                  colorBackground: const Color(0xFFD4AF35),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
