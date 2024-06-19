import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/report_history_controller.dart';
import 'package:recything_application/screens/report_history_detail/widgets/app_bar_report_history_detail_widget.dart';
import 'package:recything_application/screens/report_history_detail/widgets/condition_report_history_detail_widget.dart';
import 'package:recything_application/screens/report_history_detail/widgets/general_information_report_history_detail_widget.dart';
import 'package:recything_application/screens/report_history_detail/widgets/image_report_history_detail_widget.dart';
import 'package:recything_application/screens/report_history_detail/widgets/location_report_history_detail_widget.dart';
import 'package:recything_application/screens/report_history_detail/widgets/title_report_history_detail_widget.dart';
import 'package:recything_application/screens/report_history_detail/widgets/rubbish_material_report_history_detail_widget.dart';
import 'package:recything_application/screens/report_history_detail/widgets/rubbish_type_report_history_detail_widget.dart';
import 'package:recything_application/utils/system_ui_overlay_utils.dart';

class ReportHistoryDetailScreen extends StatelessWidget {
  const ReportHistoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayUtils().setSystemUiOverlay(ColorConstant.primaryColor500, false);
    final ReportHistoryController controller = Get.find();
    return Scaffold(
      appBar: const AppBarReportHistoryDetailWidget(),
      backgroundColor: ColorConstant.primaryColor50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SpacingConstant.verticalSpacing300,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const GeneralInformationReportHistoryDetailWidget(),
                    SpacingConstant.verticalSpacing200,
                    const LocationReportHistoryDetailWidget(),
                    SpacingConstant.verticalSpacing200,
                    const RubbishTypeReportHistoryDetailWidget(),
                    SpacingConstant.verticalSpacing200,
                    if (controller.selectedHistory.value!.reportType == 'rubbish')
                      const RubbishMaterialReportHistoryDetailWidget()
                    else
                      const TitleReportHistoryDetailWidget(),
                    SpacingConstant.verticalSpacing200,
                    const ConditionReportHistoryDetailWidget(),
                    SpacingConstant.verticalSpacing200,
                    const ImageReportHistoryDetailWidget(),
                    SpacingConstant.verticalSpacing200,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
