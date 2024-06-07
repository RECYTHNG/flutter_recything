import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:recything_application/constants/app_theme_constant.dart';
import 'package:recything_application/controllers/user/user_controller.dart';
import 'package:recything_application/screens/edit_profile/edit_profile_screen.dart';

void main() async {
  await initializeDateFormatting();
  Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeConstant.appTheme,
      debugShowCheckedModeBanner: false,
      home: EditProfileScreen(),
    );
  }
}
