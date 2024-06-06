import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/screens/report_rubbish/details/widgets/app_bar_details_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/details/widgets/condition_details_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/details/widgets/location_details_report_rubbish_widget.dart';
import 'package:recything_application/utils/system_ui_overlay_utils.dart';

class DetailsReportRubbishScreen extends StatelessWidget {
  const DetailsReportRubbishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayUtils().setSystemUiOverlay(ColorConstant.primaryColor500, false);
    return const Scaffold(
      appBar: AppBarDetailsReportRubbishWidget(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              LocationDetailsReportRubbishWidget(),
              ConditionDetailsReportRibbishWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
