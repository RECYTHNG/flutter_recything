import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/map_rubbish_controller.dart';

class ConditionDetailsReportRibbishWidget extends StatelessWidget {
  const ConditionDetailsReportRibbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MapRubbishController controller = Get.put(MapRubbishController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ceritakan Kondisi Sampah di Sekitarmu',
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor900,
          ),
        ),
        SpacingConstant.verticalSpacing100,
        Container(
          width: double.infinity,
          height: 135,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: ColorConstant.netralColor900,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: TextField(
            controller: controller.conditionController,
            expands: true,
            maxLines: null,
            decoration: InputDecoration(
              border: InputBorder.none,
              // hintText: StringValueConstant.hintTextConditionDetailsReportRubbish,
              hintStyle: TextStyleConstant.mediumParagraph.copyWith(
                color: ColorConstant.netralColor900,
              ),
            ),
          ),
        )
      ],
    );
  }
}
