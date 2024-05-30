import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/challenge_dashboard/mission_dashboard_screen.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

class MissionOnboardingScreen extends StatelessWidget {
  const MissionOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor50,
      body: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            child: Image.asset(
              ImageConstant.backgroundOnboarding,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            bottom: 450,
            right: 50,
            child: Image.asset(ImageConstant.animationOnboarding),
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Text(
                      'Ayo mulai Aksi Nyata peduli lingkungan!',
                      textAlign: TextAlign.center,
                      style: TextStyleConstant.semiboldHeading4.copyWith(
                        color: ColorConstant.netralColor50,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Mari bersama-sama mulai langkah kecil Dalam Challenge ini untuk menciptakan perubahan besar bagi bumi kita dan masa depan yang lebih baik',
                      textAlign: TextAlign.center,
                      style: TextStyleConstant.regularParagraph.copyWith(
                        color: ColorConstant.netralColor50,
                      ),
                    ),
                    const SizedBox(height: 115),
                    GlobalButtonWidget(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const MissionDashboardScreen(),
                          ),
                        );
                      },
                      width: double.infinity,
                      height: 40,
                      backgroundColor: ColorConstant.whiteColor,
                      isBorder: true,
                      title: 'Get Started',
                      textColor: ColorConstant.primaryColor500,
                      fontSize: 16,
                      borderColor: ColorConstant.primaryColor500,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
