import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ItemChallengeWidget extends StatelessWidget {
  final String point;
  final String title;
  final String image;
  final int index;
  final double? width;
  final Function() onTap;
  const ItemChallengeWidget({
    super.key,
    required this.point,
    required this.title,
    required this.image,
    required this.index,
    required this.onTap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    Color getBackgroundColor(int index) {
      switch (index % 3) {
        case 0:
          return ColorConstant.primaryColor500;
        case 1:
          return ColorConstant.primaryColor300;
        case 2:
          return ColorConstant.secondaryColor500;
        default:
          return ColorConstant.primaryColor500;
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 132,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: getBackgroundColor(index),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: ColorConstant.blackColor.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          ImageConstant.points,
                          width: 11,
                          height: 11,
                        ),
                        SpacingConstant.horizontalSpacing075,
                        Text(
                          '$point Poin',
                          style: TextStyleConstant.semiboldFooter.copyWith(
                            color: ColorConstant.warningColor500,
                          ),
                        ),
                      ],
                    ),
                    SpacingConstant.verticalSpacing100,
                    Text(
                      title,
                      style: TextStyleConstant.semiboldTitle.copyWith(
                        color: ColorConstant.netralColor50,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SpacingConstant.horizontalSpacing150,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorConstant.infoColor50,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        image,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
