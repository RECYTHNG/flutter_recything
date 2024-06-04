import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:recything_application/constants/app_theme_constant.dart';
import 'package:recything_application/screens/profile/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeConstant.appTheme,
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
      // home: const Scaffold(
      //   body: Center(
      //     child: Text('Initial Page'),
      //   ),
      // ),
    );
  }
}
