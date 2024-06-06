import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/string_value_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ConditionDetailsReportRibbishWidget extends StatelessWidget {
  const ConditionDetailsReportRibbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Ceritakan Kondisi Sampah di Sekitarmu',
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor900,
          ),
        ),
        Container(
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
              expands: true,
              maxLines: null,
              decoration: InputDecoration(
                hintText: StringValueConstant.hintTextConditionDetailsReportRubbish,
                hintStyle: TextStyleConstant.mediumParagraph.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              )),
        )
      ],
    );
  }
}
