import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/home_controller.dart';
import 'package:recything_application/screens/homepage/widgets/sections/article_section_widget.dart';
import 'package:recything_application/screens/homepage/widgets/sections/challenge_section_widget.dart';
import 'package:recything_application/screens/homepage/widgets/sections/leaderboard_section_widget.dart';
import 'package:recything_application/screens/homepage/widgets/sections/new_video_section_widget.dart';
import 'package:recything_application/screens/homepage/widgets/point/point_container_widget.dart';
import 'package:recything_application/screens/homepage/widgets/sections/report_section_widget.dart';
import 'package:recything_application/screens/homepage/widgets/search_bar_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final HomeController dataController = Get.put(HomeController());

  final List<Map<String, String>> carouselDataReport = [
    {
      'title': 'Penumpukan Sampah',
      'subtitle': 'Laporkan penumpukan sampah',
      'imagePath': 'assets/images/home_images/content_penumpukan_sampah.png',
      'footerText': 'Reporting Rubbish',
    },
    {
      'title': 'Kebersihan Lingkungan',
      'subtitle': 'Jaga kebersihan lingkungan',
      'imagePath': 'assets/images/home_images/gambar_6.png',
      'footerText': 'Environmental Cleanliness',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SingleChildScrollView(
        child: Obx(() {
          if (dataController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Stack(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: 280,
                      child: Image(
                        image: AssetImage(
                          ImageConstant.headerImage,
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 4,
                              right: 8,
                            ),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: const Image(
                                image: AssetImage(
                                  ImageConstant.logoRecythng,
                                ),
                                width: 146,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      dataController.user['picture_url'],
                                      height: 32,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Hi, ${dataController.user['name']}',
                                    style: TextStyleConstant.regularHeading4,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 180,
                        right: 24,
                        left: 24,
                      ),
                      child: PointsContainer(),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const SearchBarWidget(),
                ReportSectionWidget(carouselData: carouselDataReport),
                const SizedBox(height: 12),
                ArticleSectionWidget(),
                NewVideoSectionWidget(),
                LeaderboardSectionWidget(),
                const ChallengeSectionWidget(),
                const SizedBox(height: 32),
              ],
            );
          }
        }),
      ),
    );
  }
}
