import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/achievement_controller.dart';
import 'package:recything_application/screens/achievement_screen/widgets/advantage_achievement_widget.dart';
import 'package:recything_application/screens/achievement_screen/widgets/card_type_achievement_widget.dart';
import 'package:recything_application/screens/achievement_screen/widgets/current_point_widget.dart';
import 'package:recything_application/screens/achievement_screen/widgets/list_point_addition_history_widget.dart';

class SilverAchievementContent extends StatelessWidget {
  SilverAchievementContent({super.key});

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
                CardTypeAchievementWidget(
                  color1: const Color(0xFF545454),
                  color2: const Color(0xFF545454).withOpacity(0.95),
                  typeAchievement: 'Silver',
                  desc:
                      'Bersama, kita menjaga alam untuk kita \ndan masa depan kita.',
                  levelPoint: levelPoint,
                  achievementController: achievementController,
                  targetPoint: targetPoint,
                ),
                SpacingConstant.verticalSpacing200,
                CurrentPointWidget(
                  currentPoint: currentPoint,
                  progressValue: progressValue,
                  targetPoint: targetPoint,
                  levelPoint: levelPoint,
                  colorProgressBar: const Color(0xFF545454),
                  difference:
                      '${targetPoint - currentPoint} Poin lagi untuk kamu menjadi level gold.',
                ),
                SpacingConstant.verticalSpacing100,
                const Divider(
                  color: Color(0xFFE6E6E6),
                ),
                SpacingConstant.verticalSpacing100,
                ListPointAdditionHistoryWidget(
                  achievementController: achievementController,
                  noHistoryPointImage: ImageConstant.silverHistoryImage,
                ),
                SpacingConstant.verticalSpacing200,
                AdvantagesAchievementWidget(
                  advantagePercent: '15%',
                  svgIcon: SvgPicture.asset(
                    IconConstant.poinkuSilverAchievement,
                  ),
                  colorBackground: const Color(0xFF545454),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
