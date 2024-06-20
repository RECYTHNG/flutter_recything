import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/lottie_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/report_litter_controller.dart';
import 'package:recything_application/controllers/map_litter_controller.dart';
import 'package:recything_application/screens/dashboard_reporting/dashboard_reporting_screen.dart';
import 'package:recything_application/utils/system_ui_overlay_utils.dart';
import 'package:recything_application/widgets/global_app_bar.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

class SuccessReportLitterScreen extends StatelessWidget {
  const SuccessReportLitterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayUtils().setSystemUiOverlay(ColorConstant.whiteColor, true);
    return Scaffold(
      appBar: GlobalAppBar(
        title: Text(
          'Laporan Sukses',
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor900,
            fontFamily: 'Nunito',
          ),
        ),
        backgroundColor: ColorConstant.whiteColor,
      ),
      backgroundColor: ColorConstant.whiteColor,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 130),
              child: Column(
                children: [
                  Lottie.asset(
                    LottieConstant.verify,
                    height: 312,
                    width: 328,
                    repeat: false,
                  ),
                  SpacingConstant.verticalSpacing200,
                  Text(
                    'Laporan Berhasil Terkirim!',
                    style: TextStyleConstant.boldSubtitle.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SpacingConstant.verticalSpacing100,
                  Text(
                    'Hebat! Menjadi pahlawan untuk hari ini, esok, dan\n selamanya. Bumi tanpa sampah, tanpa resah !',
                    style: TextStyleConstant.regularCaption.copyWith(
                      color: ColorConstant.netralColor600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 48,
            child: GlobalButtonWidget(
              onTap: () {
                Get.delete<MapLitterController>();
                Get.delete<ReportLitterController>();
                Get.to(
                  () => const DashboardReportingScreen(),
                );
              },
              width: double.infinity,
              height: 40,
              backgroundColor: ColorConstant.primaryColor500,
              isBorder: false,
              title: 'Kembali ke Beranda',
              textColor: ColorConstant.netralColor50,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
