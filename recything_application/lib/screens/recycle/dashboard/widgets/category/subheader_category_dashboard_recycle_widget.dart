import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/recycle/category/category_recycle_screen.dart';

class SubheaderCategoryDashboardRecycleWidget extends StatelessWidget {
  const SubheaderCategoryDashboardRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => const CategoryRecycleScreen()),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kategori Daur Ulang',
                style: TextStyleConstant.boldSubtitle.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              ),
              InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                onTap: () => Get.to(() => const CategoryRecycleScreen()),
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
