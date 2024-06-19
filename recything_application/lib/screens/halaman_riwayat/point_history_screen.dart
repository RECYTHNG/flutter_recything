import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/achievement_controller.dart';
import 'package:recything_application/models/achievement_model.dart';
import 'package:recything_application/screens/halaman_riwayat/widgets/list_point_history_widget.dart';
import 'package:recything_application/screens/halaman_riwayat/widgets/no_record_history_point_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class PointHisstoryScreen extends StatelessWidget {
  PointHisstoryScreen({super.key});

  final AchievementController achievementController = Get.put(
    AchievementController(),
  );

  String getBadgeUrl(int points, List<DataAchievement> achievements) {
    for (int i = achievements.length - 1; i >= 0; i--) {
      if (points >= achievements[i].targetPoint!) {
        return achievements[i].badgeUrl!;
      }
    }
    return achievements.first.badgeUrl!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor50,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorConstant.netralColor50),
        backgroundColor: ColorConstant.primaryColor500,
        title: Text(
          'Riwayat Poin',
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor50,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (achievementController.isLoading.value) {
            return const Center(
              child: MyLoading(),
            );
          }

          if (achievementController.isError.value) {
            return const NoRecordHistoryPointWidget();
          }

          int currentPoint = achievementController
                  .achievementResult.value.data?.dataUser?.point ??
              0;
          List<DataAchievement> achievements = achievementController
                  .achievementResult.value.data?.dataAchievement ??
              [];
          String badgeUrl = getBadgeUrl(currentPoint, achievements);
          return Column(
            children: [
              Container(
                height: 130.0,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF00466D),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: badgeUrl,
                      height: 24.0,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    SpacingConstant.horizontalSpacing100,
                    Row(
                      children: [
                        Text(
                          currentPoint.toString(),
                          style: TextStyleConstant.semiboldHeading4.copyWith(
                            color: ColorConstant.whiteColor,
                          ),
                        ),
                        SpacingConstant.horizontalSpacing100,
                        Text(
                          'Poin',
                          style: TextStyleConstant.regularParagraph.copyWith(
                            color: ColorConstant.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SpacingConstant.verticalSpacing100,
              ListPointHistoryWidget(
                achievementController: achievementController,
              ),
            ],
          );
        },
      ),
    );
  }
}
