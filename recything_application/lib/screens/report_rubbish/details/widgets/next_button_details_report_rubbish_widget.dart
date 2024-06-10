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
    final MapRubbishController mapController = Get.find();
    final ReportRubbishController rubbishController = Get.find();
    return Positioned(
      bottom: 25,
      left: 0,
      right: 0,
      child: Obx(
        () {
          return GlobalButtonWidget(
            onTap: rubbishController.currentAddress.value.isNotEmpty &&
                    mapController.conditionController.text.isNotEmpty &&
                    (mapController.sampahBasah.value == true ||
                        mapController.sampahKering.value == true) &&
                    mapController.materialData.values
                        .any((data) => data == true)
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
                        (mapController.sampahBasah.value == true ||
                            mapController.sampahKering.value == true) &&
                        mapController.materialData.values
                            .any((data) => data == true)
                    ? ColorConstant.primaryColor500
                    : ColorConstant.netralColor500,
            isBorder: false,
            title: 'Selanjutnya',
            textColor: ColorConstant.whiteColor,
            fontSize: 14,
          );
        },
      ),
    );
  }
}
