import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/screens/authentication/login/login_screen.dart';
import 'package:recything_application/screens/dashboard_reporting/dashboard_reporting_screen.dart';
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
                  () => DashboardReportingScreen(),
                );
              },
              child: const Text('Dashboard Reporting'),
            ),
          ],
        ),
      ),
    );
  }
}
