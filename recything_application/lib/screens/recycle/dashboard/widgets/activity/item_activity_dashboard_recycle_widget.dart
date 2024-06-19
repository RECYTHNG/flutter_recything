import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ItemActivityDashboardRecycleWidget extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  final Function() onTap;
  const ItemActivityDashboardRecycleWidget({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 105,
        width: 375,
        decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              blurRadius: 19,
              color: ColorConstant.blackColor.withOpacity(0.08),
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              image,
            ),
            SpacingConstant.horizontalSpacing250,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyleConstant.boldParagraph,
                  ),
                  Text(
                    desc,
                    style: TextStyleConstant.mediumCaption.copyWith(
                      color: const Color(0XFF828282),
                    ),
                  ),
                ],
              ),
            ),
            SpacingConstant.horizontalSpacing250,
            Image.asset(
              ImageConstant.arrow,
              width: 24,
            )
          ],
        ),
      ),
    );
  }
}
