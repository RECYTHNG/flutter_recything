import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ItemSimpleVideoRecycleWidget extends StatelessWidget {
  final String thumbnail;
  final String title;
  final int views;
  final Function() onTap;
  const ItemSimpleVideoRecycleWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.views,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 180,
        height: 234,
        decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: const Color(0XFF64646F).withOpacity(0.2),
              offset: const Offset(0, 7),
              blurRadius: 29,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 146,
                  child: Image.network(
                    thumbnail,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Image.asset(
                      ImageConstant.play,
                      width: 30,
                      height: 30,
                    ),
                  ),
                )
              ],
            ),
            SpacingConstant.verticalSpacing050,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleConstant.semiboldParagraph.copyWith(
                      color: ColorConstant.blackColor,
                    ),
                  ),
                  SpacingConstant.verticalSpacing100,
                  Text(
                    '$views ditonton',
                    style: TextStyleConstant.regularFooter.copyWith(
                      color: const Color(0XFF333333),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
