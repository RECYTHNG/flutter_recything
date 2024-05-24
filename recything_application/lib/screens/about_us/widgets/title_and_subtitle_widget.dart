import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class TitleAndSubtitleWidget extends StatelessWidget {
  const TitleAndSubtitleWidget(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor900,
          ),
        ),
        Container(),
        SpacingConstant.verticalSpacing050,
        Text(
          subTitle,
          style: TextStyleConstant.mediumCaption
              .copyWith(color: ColorConstant.netralColor900),
        ),
      ],
    );
  }
}
