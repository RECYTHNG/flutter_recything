import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/screens/report_litter/pick_location/widget/footer_maps_report_litter_widget.dart';
import 'package:recything_application/screens/report_litter/pick_location/widget/header_maps_report_litter_widget.dart';
import 'package:recything_application/screens/report_litter/pick_location/widget/location_maps_report_litter_widget.dart';
import 'package:recything_application/utils/system_ui_overlay_utils.dart';

class PickLitterLocationScreen extends StatelessWidget {
  const PickLitterLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayUtils().setSystemUiOverlay(ColorConstant.whiteColor, true);
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            LocationMapsReportLitterWidget(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: FooterMapsReportLitterWidget(),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: HeaderMapsReportLitterWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
