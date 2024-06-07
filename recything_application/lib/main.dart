import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/app_theme_constant.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:recything_application/controllers/user_profile_controller.dart';
import 'package:recything_application/screens/edit_profile/edit_profile_screen.dart';

void main() async {
  await initializeDateFormatting();
  Get.put(UserProfileController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeConstant.appTheme,
      debugShowCheckedModeBanner: false,
      home: EditProfileScreen(),
    );
  }
}
