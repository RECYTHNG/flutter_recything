import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ItemCategoryCustomerService extends StatelessWidget {
  final String title;
  final String image;
  const ItemCategoryCustomerService({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 40.0,
            width: 40.0,
          ),
          SpacingConstant.verticalSpacing100,
          Text(
            title,
            style: TextStyleConstant.semiboldParagraph.copyWith(
              fontSize: 10.0,
              color: ColorConstant.netralColor600,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
