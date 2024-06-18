import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class AppBarMapsReportLitterWidget extends StatelessWidget {
  const AppBarMapsReportLitterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: ColorConstant.netralColor900,
          ),
        ),
        const Spacer(),
        Text(
          'Pilih Lokasi',
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor900,
          ),
        ),
        const Spacer(),
        SpacingConstant.horizontalSpacing600,
      ],
    );
  }
}
