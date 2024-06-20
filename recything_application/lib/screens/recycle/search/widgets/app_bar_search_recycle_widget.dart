import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';

class AppBarSearchRecycleWidget extends StatelessWidget {
  const AppBarSearchRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 16,
        bottom: 12,
        top: 48,
      ),
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0XFF101828).withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 5,
          ),
        ],
        borderRadius: const BorderRadius.vertical(
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
