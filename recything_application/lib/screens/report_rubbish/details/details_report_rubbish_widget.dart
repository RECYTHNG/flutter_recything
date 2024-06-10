import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/report_rubbish_controller.dart';
import 'package:recything_application/screens/report_rubbish/details/widgets/condition_details_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/details/widgets/location_details_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/details/widgets/material_details_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/details/widgets/next_button_details_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/details/widgets/type_details_report_rubbish_widget.dart';
import 'package:recything_application/utils/system_ui_overlay_utils.dart';

class DetailsReportRubbishWidget extends StatelessWidget {
  const DetailsReportRubbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayUtils().setSystemUiOverlay(ColorConstant.primaryColor500, false);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConstant.whiteColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpacingConstant.verticalSpacing250,
                    const LocationDetailsReportRubbishWidget(),
                    SpacingConstant.verticalSpacing250,
                    const ConditionDetailsReportRibbishWidget(),
                    SpacingConstant.verticalSpacing250,
                    const TypeDetailsReportRubbishWidget(),
                    SpacingConstant.verticalSpacing200,
                    const MaterialDetailsReportRubbishWidget(),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: NextButtonDetailsReportRubbishWidget(),
          ),
          SpacingConstant.verticalSpacing250,
        ],
      ),
    );
  }
}
