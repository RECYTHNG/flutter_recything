import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class SubheaderArticleDashboardRecycleWidget extends StatelessWidget {
  const SubheaderArticleDashboardRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Artikel Khusus Untukmu',
                style: TextStyleConstant.boldSubtitle.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              ),
              InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                onTap: () {},
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
