import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ItemContainerReportHistoryDetailWidget extends StatelessWidget {
  final String name;
  const ItemContainerReportHistoryDetailWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12,
      ),
      decoration: const BoxDecoration(
        color: ColorConstant.primaryColor500,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Text(
        name,
        style: TextStyleConstant.semiboldParagraph.copyWith(
          color: ColorConstant.whiteColor,
        ),
      ),
    );
  }
}
