import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/home_controller.dart';
import 'package:recything_application/controllers/leaderboard_controller.dart';
import 'package:recything_application/screens/homepage/widgets/top_three_leaderboard_widget.dart';
import 'package:recything_application/screens/leaderboard/leaderboard_screen.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class LeaderboardSectionWidget extends StatelessWidget {
  LeaderboardSectionWidget({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 24,
        left: 24,
        top: 24,
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Leaderboard',
                    style: TextStyleConstant.boldSubtitle,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(
                        () => LeaderboardScreen(),
                      );
                    },
                    child: Text(
                      'Lihat Selengkapnya',
                      style: TextStyleConstant.semiboldCaption.copyWith(
                        color: ColorConstant.primaryColor500,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Ikuti challenge dan rebut posisi tertinggi di leaderboard!',
                style: TextStyleConstant.regularParagraph,
                maxLines: 2,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Obx(
            () {
              if (controller.leaderboard.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 197,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorConstant.primaryColor400,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/leaderboard/gambar_1.png',
                                height: 148,
                              ),
                              Text(
                                'Leaderboard masih kosong. Segera ikuti Challenge dan raih posisi teratas!',
                                style:
                                    TextStyleConstant.regularParagraph.copyWith(
                                  color: ColorConstant.whiteColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstant.whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Ikuti Challenge',
                            style: TextStyleConstant.regularTitle.copyWith(
                              color: ColorConstant.primaryColor500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              controller.leaderboard.sort(
                (a, b) => int.parse(b['point']!).compareTo(
                  int.parse(a['point']!),
                ),
              );

              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorConstant.primaryColor400,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (controller.leaderboard.length > 1)
                          TopThreeLeaderboardItem(
                            imageUrl: controller.leaderboard[1]['picture_url']!,
                            name: controller.leaderboard[1]['name']!,
                            score: controller.leaderboard[1]['point']!,
                            rank: 2,
                            badgeUrl: controller.leaderboard[1]['badge']!,
                          ),
                        TopThreeLeaderboardItem(
                          imageUrl: controller.leaderboard[0]['picture_url']!,
                          name: controller.leaderboard[0]['name']!,
                          score: controller.leaderboard[0]['point']!,
                          rank: 1,
                          badgeUrl: controller.leaderboard[0]['badge']!,
                        ),
                        if (controller.leaderboard.length > 2)
                          TopThreeLeaderboardItem(
                            imageUrl: controller.leaderboard[2]['picture_url']!,
                            name: controller.leaderboard[2]['name']!,
                            score: controller.leaderboard[2]['point']!,
                            rank: 3,
                            badgeUrl: controller.leaderboard[2]['badge']!,
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
