import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';

class AppBarResultByKeywordWidget extends StatelessWidget {
  const AppBarResultByKeywordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 16,
        bottom: 12,
        top: 48,
      ),
      decoration: const BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: ColorConstant.netralColor900,
              size: 24,
            ),
            onPressed: () => Get.back(),
          ),
          SpacingConstant.horizontalSpacing100,
        ],
      ),
    );
  }
}
