import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/app_theme_constant.dart';
import 'package:recything_application/screens/video_content/video_content_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeConstant.appTheme,
      debugShowCheckedModeBanner: false,
      home: VideoContentScreen(),
      // home: const Scaffold(
      //   body: Center(
      //     child: Text('Hello World!'),
      //   )
      // ),
    );
  }
}
