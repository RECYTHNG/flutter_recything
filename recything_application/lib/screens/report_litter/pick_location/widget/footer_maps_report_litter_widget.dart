import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/map_litter_controller.dart';
import 'package:recything_application/screens/report_litter/pick_location/widget/current_location_button_maps_report_litter_widget.dart';
import 'package:recything_application/screens/report_litter/pick_location/widget/next_button_maps_report_litter_widget.dart';
import 'package:recything_application/screens/report_litter/pick_location/widget/result_place_maps_report_litter_widget.dart';

class FooterMapsReportLitterWidget extends StatelessWidget {
  const FooterMapsReportLitterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MapLitterController controller = Get.find();
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
              const CurrentLocationButtonMapsReportLitterWidget(),
              SpacingConstant.verticalSpacing300,
              if (controller.currentAddress.value.isNotEmpty) ...[
                const ResultPlaceMapsReportLitterWidget(),
                SpacingConstant.verticalSpacing200,
              ],
              const NextButtonMapsReportLitterWidget(),
            ],
          );
        },
      ),
    );
  }
}
