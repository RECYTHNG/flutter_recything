import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class EmptyStateHistoryDashboardReportingWidget extends StatelessWidget {
  const EmptyStateHistoryDashboardReportingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpacingConstant.verticalSpacing300,
        Image.asset(
          ImageConstant.emptyStateHistory,
          width: 100,
        ),
        SpacingConstant.verticalSpacing200,
        Text(
          'Kamu belum pernah melaporkan',
          style: TextStyleConstant.semiboldParagraph.copyWith(
            color: ColorConstant.netralColor700,
          ),
        )
      ],
    );
  }
}