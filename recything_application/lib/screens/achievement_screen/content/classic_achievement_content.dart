import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/achievement_controller.dart';
import 'package:recything_application/screens/achievement_screen/widgets/advantage_achievement_widget.dart';
import 'package:recything_application/screens/achievement_screen/widgets/card_type_achievement_widget.dart';
import 'package:recything_application/screens/achievement_screen/widgets/list_point_addition_history_widget.dart';

class ClassicAchievementContent extends StatelessWidget {
  ClassicAchievementContent({super.key});

  final AchievementController achievementController = Get.put(
    AchievementController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () {
            int currentPoint = achievementController
                    .achievementResult.value.data?.dataUser?.point ??
                0;
            int levelPoint = achievementController.achievementResult.value.data
                    ?.dataAchievement?[0].targetPoint ??
                0;
            int targetPoint = achievementController.achievementResult.value.data
                    ?.dataAchievement?[1].targetPoint ??
                0;
            double progressValue =
                (targetPoint > 0) ? currentPoint / targetPoint : 0;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardTypeAchievementWidget(
                  color1: const Color(0xFF4F3415),
                  color2: const Color(0xFF4F3415).withOpacity(0.95),
                  typeAchievement: 'Classic',
                  desc:
                      'Awal yang baik menuju bumi yang lebih \nbersih dan sehat untuk keluarga kita.',
                  levelPoint: levelPoint,
                  achievementController: achievementController,
                  targetPoint: targetPoint,
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
                      color: const Color(0xFF4F3415),
                    ),
                    SpacingConstant.verticalSpacing100,
                    Text(
                      currentPoint >= targetPoint
                          ? 'Poin kamu sudah melewati batas level lencana ini'
                          : '${targetPoint - currentPoint} Poin lagi untuk kamu menjadi level silver',
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
                  noHistoryPointImage: ImageConstant.classicHistoryImage,
                ),
                SpacingConstant.verticalSpacing200,
                AdvantagesAchievementWidget(
                  advantagePercent: '10%',
                  svgIcon: SvgPicture.asset(
                    IconConstant.poinkuClassicAchievement,
                  ),
                  colorBackground: const Color(
                    0xFF4F3415,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
