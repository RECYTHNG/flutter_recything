import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/screens/achievement_screen/achievement_screen.dart';
import 'package:recything_application/screens/authentication/login/login_screen.dart';
import 'package:recything_application/screens/customer_service/cutomer_service_faq_main/customer_service_screen.dart';
import 'package:recything_application/screens/profile/profile_screen.dart';
import 'package:recything_application/utils/shared_pref.dart';

class HomeAuthenticationScreen extends StatefulWidget {
  const HomeAuthenticationScreen({super.key});

  @override
  State<HomeAuthenticationScreen> createState() =>
      _HomeAuthenticationScreenState();
}

class _HomeAuthenticationScreenState extends State<HomeAuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                SharedPref.removeToken();
                Get.off(
                  () => LoginAuthenticationScreen(),
                );
              },
              child: const Text('Logout'),
            ),
            SpacingConstant.verticalSpacing100,
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => CustomerServiceScreen(),
                );
              },
              child: const Text('Customer Service'),
            ),
            SpacingConstant.verticalSpacing100,
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const AchievementScreen(),
                );
              },
              child: const Text('Achievement'),
            ),
            SpacingConstant.verticalSpacing100,
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => ProfileScreen(),
                );
              },
              child: const Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
