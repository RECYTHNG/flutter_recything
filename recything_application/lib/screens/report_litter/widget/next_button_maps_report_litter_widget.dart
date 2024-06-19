import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/controllers/map_litter_controller.dart';
import 'package:recything_application/screens/report_litter/report_litter_screen.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

class NextButtonMapsReportLitterWidget extends StatelessWidget {
  const NextButtonMapsReportLitterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MapLitterController controller = Get.find();
    return Obx(
      () {
        return GlobalButtonWidget(
          onTap: controller.currentAddress.value.isEmpty
              ? () {}
              : () => Get.off(const LitterDescScreen()),
          width: double.infinity,
          height: 40,
          backgroundColor: controller.currentAddress.value.isNotEmpty
              ? ColorConstant.primaryColor500
              : ColorConstant.netralColor500,
          isBorder: false,
          title: 'Selanjutnya',
          textColor: ColorConstant.netralColor50,
          fontSize: 14,
        );
      },
    );
  }
}
