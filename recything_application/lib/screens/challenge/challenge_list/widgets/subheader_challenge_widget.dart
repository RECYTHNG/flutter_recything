import 'package:flutter/material.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class SubheaderChallengeWidget extends StatelessWidget {
  const SubheaderChallengeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Challenges',
              style: TextStyleConstant.boldSubtitle,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Challenges yang Bisa Kamu ikuti',
              style: TextStyleConstant.regularParagraph,
            ),
          ],
        ),
      ],
    );
  }
}