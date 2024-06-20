import 'package:flutter/material.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ItemCategoryRecycleWidget extends StatelessWidget {
  final String image;
  final String category;
  final Function() onTap;
  const ItemCategoryRecycleWidget({
    super.key,
    required this.image,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 90,
        height: 121,
        child: Column(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0XFFF5F5F5),
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Image.asset(
                    image,
                  ),
                ),
              ),
            ),
            SpacingConstant.verticalSpacing075,
            Text(
              category,
              style: TextStyleConstant.mediumSubtitle.copyWith(
                color: const Color(0XFF171717),
              ),
            )
          ],
        ),
      ),
    );
  }
}
