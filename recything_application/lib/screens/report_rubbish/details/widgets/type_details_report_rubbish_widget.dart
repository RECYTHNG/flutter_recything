import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/map_rubbish_controller.dart';

class TypeDetailsReportRubbishWidget extends StatelessWidget {
  const TypeDetailsReportRubbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MapRubbishController controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jenis Sampah',
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor900,
          ),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                    activeColor: ColorConstant.primaryColor500,
                    overlayColor: WidgetStateProperty.resolveWith((states) {
                      return ColorConstant.primaryColor100;
                    }),
                    value: controller.sampahBasah.value,
                    onChanged: (value) {
                      controller.sampahBasah.value = value!;
                    },
                  ),
                  Text(
                    'Sampah Basah',
                    style: TextStyleConstant.mediumParagraph.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  ),
                ],
              ),
              SpacingConstant.horizontalSpacing500,
              Row(
                children: [
                  Checkbox(
                    activeColor: ColorConstant.primaryColor500,
                    overlayColor: WidgetStateProperty.resolveWith((states) {
                      return ColorConstant.primaryColor100;
                    }),
                    value: controller.sampahKering.value,
                    onChanged: (value) {
                      controller.sampahKering.value = value!;
                    },
                  ),
                  Text(
                    'Sampah Kering',
                    style: TextStyleConstant.mediumParagraph.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
