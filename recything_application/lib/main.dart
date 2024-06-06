import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:recything_application/constants/app_theme_constant.dart';
import 'package:recything_application/screens/dashboard_reporting/dashboard_reporting_screen.dart';
import 'package:recything_application/screens/report_rubbish/maps/maps_report_rubbish_screen.dart';

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
      home: const MapsReportRubbishScreen(),
    );
  }
}