import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/controllers/map_rubbish_controller.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

class SubmitButtonUploadImageReportRubbishWidget extends StatelessWidget {
  const SubmitButtonUploadImageReportRubbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MapRubbishController controller = Get.find();
    return Obx(
      () {
        return GlobalButtonWidget(
          onTap: () {
            controller.showConfirmationDialog();
          },
          width: double.infinity,
          height: 40,
          backgroundColor: controller.imageFiles.isNotEmpty
              ? ColorConstant.primaryColor500
              : ColorConstant.netralColor500,
          isBorder: false,
          title: 'Kirim Laporan',
          textColor: ColorConstant.netralColor50,
          fontSize: 14,
        );
      },
    );
  }
}
