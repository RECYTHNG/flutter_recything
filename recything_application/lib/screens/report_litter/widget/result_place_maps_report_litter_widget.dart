import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/report_litter_controller.dart';

class ResultPlaceMapsReportLitterWidget extends StatelessWidget {
  const ResultPlaceMapsReportLitterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportLitterController controller = Get.find();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.blackColor.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            ImageConstant.locationResult,
            height: 21,
            width: 24,
          ),
          SpacingConstant.horizontalSpacing150,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  return Text(
                    controller.currentAddress.value,
                    style: TextStyleConstant.regularParagraph.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
