import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';
import 'package:recything_application/controllers/home_controller.dart';
import 'package:recything_application/screens/homepage/widgets/sections/article_section_widget.dart';
import 'package:recything_application/screens/homepage/widgets/sections/challenge_section_widget.dart';
import 'package:recything_application/screens/homepage/widgets/sections/leaderboard_section_widget.dart';
import 'package:recything_application/screens/homepage/widgets/sections/new_video_section_widget.dart';
import 'package:recything_application/screens/homepage/widgets/point/point_container_widget.dart';
import 'package:recything_application/screens/homepage/widgets/sections/report_section_widget.dart';
import 'package:recything_application/screens/homepage/widgets/search_bar_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final HomeController dataController = Get.put(HomeController());
  final ChallengeDashboardController challengeController = Get.put(ChallengeDashboardController());
  

  final List<Map<String, String>> carouselDataReport = [
    {
      'title': 'Penumpukan Sampah',
      'subtitle': 'Laporkan penumpukan sampah',
      'imagePath': 'assets/images/home_images/content_penumpukan_sampah.png',
      'footerText': 'Reporting Rubbish',
    },
    {
      'title': 'Buang Sampah Sembarangan',
      'subtitle': 'Laporkan pembuangan sampah sembarangan',
      'imagePath': 'assets/images/home_images/gambar_6.png',
      'footerText': 'Reporting Littering',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Obx(() {
        if (dataController.isLoading.value) {
          return const Center(child: MyLoading());
        } else {
          return SingleChildScrollView(
              child: Column(
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
                      fit: BoxFit.fitHeight,
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
                                Container(
                                  width: 32,
                                  height: 32,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      dataController.user['picture_url'],
                                      height: 32,
                                      width: 32,
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context,
                                          Object error,
                                          StackTrace? stackTrace) {
                                        return Container(
                                          color: Colors.grey[200],
                                          child: const Icon(
                                            Icons.person,
                                            color: ColorConstant.netralColor700,
                                            size: 32,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  width: 250,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Hi, ${dataController.user['name']}',
                                        style:
                                            TextStyleConstant.regularHeading4,
                                        overflow: TextOverflow.ellipsis,
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
          ));
        }
      }),
    );
  }
}
