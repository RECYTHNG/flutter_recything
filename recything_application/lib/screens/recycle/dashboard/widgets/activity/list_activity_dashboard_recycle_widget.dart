import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/screens/challenge/onboarding/challenge_onboarding_screen.dart';
import 'package:recything_application/screens/homepage/home_navbar_screen.dart';
import 'package:recything_application/screens/recycle/dashboard/widgets/activity/item_activity_dashboard_recycle_widget.dart';
import 'package:recything_application/screens/recycle/dashboard/widgets/activity/subheader_activity_dashboard_recycle_widget.dart';

class ListActivityDashboardRecycleWidget extends StatelessWidget {
  const ListActivityDashboardRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'image': ImageConstant.challenge,
        'title': 'My Challenge',
        'desc': 'Lakukan Challenge dan raih poinmu!',
      },
      {
        'image': ImageConstant.reporting,
        'title': 'Reporting Trash',
        'desc': 'Ayo laporkan sampah disekitarmu! Tanpa sampah tanpa resah.',
      },
    ];

    return Column(
      children: [
        const SubheaderActivityDashboardRecycleWidget(),
        SpacingConstant.verticalSpacing150,
        SizedBox(
          height: 105,
          child: ListView.separated(
            separatorBuilder: (context, index) => SpacingConstant.horizontalSpacing200,
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) {
              final item = items[index];
              return Column(
                children: [
                  ItemActivityDashboardRecycleWidget(
                    image: item['image']!,
                    title: item['title']!,
                    desc: item['desc']!,
                    onTap: () {
                      index == 0
                          ? Get.to(() => const ChallengeOnboardingScreen())
                          : Get.offAll(() => HomeNavBarScreen(currentIndex: 2));
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
