import 'package:flutter/material.dart';
import 'package:recything_application/constants/app_theme_constant.dart';
import 'package:recything_application/screens/report_litter/litter_desc_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeConstant.appTheme,
      debugShowCheckedModeBanner: false,
      home: const LitterDescScreen(),
    );
  }
}
