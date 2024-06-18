import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ItemListFaqWidget extends StatelessWidget {
  final String question;
  final VoidCallback onTap;
  const ItemListFaqWidget({
    super.key,
    required this.question,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                question,
                style: TextStyleConstant.semiboldCaption.copyWith(
                  fontSize: 12.0,
                  color: ColorConstant.netralColor900,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                onTap();
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 16.0,
                color: ColorConstant.netralColor900,
              ),
            ),
          ],
        ),
        const Divider(
          color: ColorConstant.netralColor500,
          thickness: 1.0,
        ),
      ],
    );
  }
}
