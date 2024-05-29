import 'package:carousel_indicator_simple/carousel_indicator_simple.dart';
import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/shadow_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class CustomCarouselItem extends StatelessWidget {
  final int pageViewIndex;
  final String title;
  final String subtitle;
  final String imagePath;
  final String footerText;

  const CustomCarouselItem({
    super.key,
    required this.pageViewIndex,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.footerText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      alignment: Alignment.center,
      width: 372,
      height: 224,
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: ShadowConstant.shadowLg,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 348,
              height: 164,
              decoration: BoxDecoration(
                color: ColorConstant.primaryColor400,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  alignment: Alignment.centerRight,
                  image: AssetImage(imagePath),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyleConstant.boldSubtitle
                                .copyWith(color: ColorConstant.whiteColor),
                          ),
                          Text(
                            subtitle,
                            style: TextStyleConstant.regularCaption
                                .copyWith(color: ColorConstant.whiteColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: ColorConstant.primaryColor200,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        footerText,
                        style: TextStyleConstant.boldSubtitle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CarouselIndicatorSimple(
              activeIndicatorColor: ColorConstant.blackColor,
              itemsCount: 3,
              activeIndex: pageViewIndex,
            ),
          ],
        ),
      ),
    );
  }
}
