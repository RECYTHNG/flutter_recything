import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/screens/report_rubbish/maps/widgets/footer/footer_maps_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/maps/widgets/header/header_maps_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/maps/widgets/location_maps_report_rubbish_widget.dart';
import 'package:recything_application/utils/system_ui_overlay_utils.dart';

class MapsReportRubbishScreen extends StatelessWidget {
  const MapsReportRubbishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayUtils().setSystemUiOverlay(ColorConstant.whiteColor, true);
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            LocationMapsReportRubbishWidget(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: FooterMapsReportRubbishWidget(),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: HeaderMapsReportRubbishWidget(),
            ),
          ],
        ),
      ),
    );
  }
}