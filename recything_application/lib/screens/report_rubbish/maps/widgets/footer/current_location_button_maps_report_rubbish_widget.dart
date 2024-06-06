import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/report_rubbish_controller.dart';

class CurrentLocationButtonMapsReportRubbishWidget extends StatelessWidget {
  const CurrentLocationButtonMapsReportRubbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportRubbishController controller = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: controller.getCurrentPosition,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstant.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: ColorConstant.blackColor.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                IconConstant.currentLocation,
              ),
            ),
          ),
        ),
        SpacingConstant.horizontalSpacing100,
      ],
    );
  }
}
