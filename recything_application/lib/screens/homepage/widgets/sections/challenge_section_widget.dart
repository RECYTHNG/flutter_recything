import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/challenge/dashboard/challenge_dashboard_screen.dart';
import 'package:recything_application/screens/homepage/home_navbar_screen.dart';

class ChallengeSectionWidget extends StatelessWidget {
  const ChallengeSectionWidget({super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Challenge',
                    style: TextStyleConstant.boldSubtitle,
                  ),
                  Text(
                    'Ikuti Challenge dan Dapatkan Poin!',
                    style: TextStyleConstant.regularParagraph,
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Get.offAll(
                    () => HomeNavBarScreen(
                      currentIndex: 3,
                    ),
                  );
                },
                child: Text(
                  'Lihat Semua',
                  style: TextStyleConstant.semiboldCaption.copyWith(
                    color: ColorConstant.primaryColor500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 156,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorConstant.primaryColor400,
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                  scale: 2.5,
                  image: AssetImage(ImageConstant.gambarIkutiChallenge),
                  alignment: Alignment.topRight),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ikuti Challenge Recything',
                    style: TextStyleConstant.boldSubtitle.copyWith(
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Text(
                      'Ikuti Challenge dan Jadilah Pahlawan Lingkungan!',
                      style: TextStyleConstant.regularCaption.copyWith(
                        color: ColorConstant.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
