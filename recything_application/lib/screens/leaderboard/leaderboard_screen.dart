import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/leaderboard_controller.dart';
import 'package:recything_application/screens/leaderboard/widgets/leaderboard_list_widget.dart';
import 'package:recything_application/screens/leaderboard/widgets/leaderboard_top_three_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class LeaderboardScreen extends StatelessWidget {
  LeaderboardScreen({super.key});

  final LeaderboardController controller = Get.put(LeaderboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor500,
        foregroundColor: ColorConstant.whiteColor,
        title: Text(
          'Leaderboard',
          style: TextStyleConstant.semiboldHeading4.copyWith(
            color: ColorConstant.whiteColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: ColorConstant.primaryColor500,
        ),
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(child: MyLoading());
            }

            if (controller.leaderboardList.isEmpty) {
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

            controller.leaderboardList.sort(
              (a, b) => int.parse(b['point']!).compareTo(
                int.parse(a['point']!),
              ),
            );

            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
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
                            if (controller.leaderboardList.length > 1)
                              TopThreeLeaderboardItem(
                                imageUrl: controller.leaderboardList[1]
                                    ['picture_url']!,
                                name: controller.leaderboardList[1]['name']!,
                                score: controller.leaderboardList[1]['point']!,
                                rank: 2,
                                badgeUrl: controller.leaderboardList[1]
                                    ['badge']!,
                              ),
                            TopThreeLeaderboardItem(
                              imageUrl: controller.leaderboardList[0]
                                  ['picture_url']!,
                              name: controller.leaderboardList[0]['name']!,
                              score: controller.leaderboardList[0]['point']!,
                              rank: 1,
                              badgeUrl: controller.leaderboardList[0]['badge']!,
                            ),
                            if (controller.leaderboardList.length > 2)
                              TopThreeLeaderboardItem(
                                imageUrl: controller.leaderboardList[2]
                                    ['picture_url']!,
                                name: controller.leaderboardList[2]['name']!,
                                score: controller.leaderboardList[2]['point']!,
                                rank: 3,
                                badgeUrl: controller.leaderboardList[2]
                                    ['badge']!,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: ColorConstant.primaryColor400,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      child: LeaderboardList(
                          leaderboardList: controller.leaderboardList),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
