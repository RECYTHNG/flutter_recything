import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/report_rubbish_controller.dart';
import 'package:recything_application/screens/report_rubbish/maps/widgets/footer/current_location_button_maps_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/maps/widgets/footer/next_button_maps_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/maps/widgets/footer/result_place_maps_report_rubbish_widget.dart';

class FooterMapsReportRubbishWidget extends StatelessWidget {
  const FooterMapsReportRubbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportRubbishController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 33,
      ),
      child: Obx(
        () {
          return Column(
            children: [
              const CurrentLocationButtonMapsReportRubbishWidget(),
              SpacingConstant.verticalSpacing300,
              if (controller.currentAddress.value.isNotEmpty) ...[
                const ResultPlaceMapsReportRubbishWidget(),
                SpacingConstant.verticalSpacing200,
              ],
              const NextButtonMapsReportRubbishWidget(),
            ],
          );
        },
      ),
    );
  }
}
