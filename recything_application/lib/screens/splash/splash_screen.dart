import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/screens/challenge/onboarding/challenge_onboarding_screen.dart';
import 'package:recything_application/screens/home.dart';
import 'package:recything_application/screens/on_boarding/on_boarding_screen.dart';
import 'package:recything_application/utils/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkToken() async {
    final token = await SharedPref.getToken();

    Future.delayed(
      const Duration(seconds: 5),
      () {
        if (token != null) {
          Get.off(
            () => const ChallengeOnboardingScreen(),
          );
        } else {
          Get.off(
            () => const OnBoardingScreen(),
          );
        }
      },
    );
  }

  @override
  void initState() {
    checkToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.netralColor50,
      body: Center(
          child: Image.asset(
        ImageConstant.logo,
        height: 50.0,
        width: 255.0,
      )),
    );
  }
}
