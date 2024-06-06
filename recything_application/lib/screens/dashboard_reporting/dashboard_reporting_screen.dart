import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/lottie_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/report_history_controller.dart';
import 'package:recything_application/screens/dashboard_reporting/widgets/history/history_dashboard_reporting_widget.dart';
import 'package:recything_application/screens/dashboard_reporting/widgets/icon_decoration_dashboard_reporting_widget.dart';
import 'package:recything_application/screens/dashboard_reporting/widgets/report_type/report_type_dashboard_reporting_widget.dart';
import 'package:recything_application/utils/system_ui_overlay_utils.dart';

class DashboardReportingScreen extends StatelessWidget {
  DashboardReportingScreen({super.key});
  final ReportHistoryController controller = Get.put(ReportHistoryController());
  @override
  Widget build(BuildContext context) {
    SystemUiOverlayUtils()
        .setSystemUiOverlay(ColorConstant.primaryColor500, false);
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor500,
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Lottie.asset(LottieConstant.headerReportingDashboard),
          ),
          Positioned(
            top: 257,
            left: 0,
            right: 0,
            child: Container(
              height: 700,
              decoration: const BoxDecoration(
                color: ColorConstant.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  children: [
                    const ReportTypeDashboardReportingWidget(),
                    SpacingConstant.verticalSpacing200,
                    const HistoryDashboardReportingWidget()
                  ],
                ),
              ),
            ),
          ),
          const IconDecorationDashboardReportingWidget(),
        ],
      ),
    );
  }
}
