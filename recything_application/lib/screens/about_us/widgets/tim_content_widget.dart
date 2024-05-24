import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/about_us/widgets/image_container_widget.dart';

class TimContentWidget extends StatelessWidget {
  const TimContentWidget(
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
        SpacingConstant.verticalSpacing150,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageContainerWidget(
                assetName: "assets/images/about_us_image/image 2.png"),
            ImageContainerWidget(
                assetName: "assets/images/about_us_image/image 2.png"),
            ImageContainerWidget(
                assetName: "assets/images/about_us_image/image 2.png"),
          ],
        ),
        SpacingConstant.verticalSpacing150,
        Text(
          subTitle,
          style: TextStyleConstant.mediumCaption
              .copyWith(color: ColorConstant.netralColor900),
        ),
      ],
    );
  }
}
