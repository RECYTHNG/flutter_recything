import 'package:flutter/material.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class EmptyStateChallengeWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double? fontSize;
  const EmptyStateChallengeWidget({
    super.key,
    this.width,
    this.height,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * (height ?? 0.6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstant.emptyStateChallenge, width: width),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum ada challenge yang kamu ikuti.\nYuk mulai challenge pertamamu!',
                   style: TextStyleConstant.regularParagraph.copyWith(fontSize: fontSize ?? 14),
                   textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
