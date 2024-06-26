import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/video_content/video_content_screen.dart';

class SubheaderVideoDashboardRecycleWidget extends StatelessWidget {
  const SubheaderVideoDashboardRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => VideoContentScreen()),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Video Khusus Untukmu',
                style: TextStyleConstant.boldSubtitle.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              ),
              InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                onTap: () => Get.to(() => VideoContentScreen()),
                splashColor: ColorConstant.netralColor600,
                child: Text(
                  'Lihat Semua',
                  style: TextStyleConstant.mediumParagraph.copyWith(
                    color: ColorConstant.infoColor500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
