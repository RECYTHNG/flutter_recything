import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/controllers/map_rubbish_controller.dart';
import 'package:recything_application/controllers/report_rubbish_controller.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

class NextButtonDetailsReportRubbishWidget extends StatelessWidget {
  const NextButtonDetailsReportRubbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapRubbishController>(
      builder: (mapController) {
        return GetBuilder<ReportRubbishController>(
          builder: (rubbishController) {
            return GlobalButtonWidget(
              onTap: rubbishController.currentAddress.value.isNotEmpty &&
                      mapController.conditionController.text.isNotEmpty &&
                      (mapController.sampahBasah.value ||
                          mapController.sampahKering.value) &&
                      mapController.materialData.values
                          .any((data) => data)
                  ? () {
                      mapController.collectData(
                        rubbishController.lat.value,
                        rubbishController.long.value,
                        rubbishController.address.value,
                        rubbishController.city.value,
                        rubbishController.province.value,
                      );
                    }
                  : () {},
              width: double.infinity,
              height: 40,
              backgroundColor:
                  rubbishController.currentAddress.value.isNotEmpty &&
                          mapController.conditionController.text.isNotEmpty &&
                          (mapController.sampahBasah.value ||
                              mapController.sampahKering.value) &&
                          mapController.materialData.values
                              .any((data) => data)
                      ? ColorConstant.primaryColor500
                      : ColorConstant.netralColor500,
              isBorder: false,
              title: 'Selanjutnya',
              textColor: ColorConstant.whiteColor,
              fontSize: 14,
            );
          },
        );
      },
    );
  }
}
