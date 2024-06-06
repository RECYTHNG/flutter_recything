import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/controllers/report_rubbish_controller.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

class NextButtonMapsReportRubbishWidget extends StatelessWidget {
  const NextButtonMapsReportRubbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportRubbishController controller = Get.find();
    return Obx(
      () {
        return GlobalButtonWidget(
          onTap: () {},
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
