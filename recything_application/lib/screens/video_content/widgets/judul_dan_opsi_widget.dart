import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class JudulDanOpsiWidget extends StatelessWidget {
  const JudulDanOpsiWidget(
      {super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyleConstant.boldParagraph
                    .copyWith(color: ColorConstant.netralColor900),
              ),
              Text(
                subTitle,
                style: TextStyleConstant.regularFooter
                    .copyWith(color: ColorConstant.netralColor900),
              )
            ],
          ),
          Container(
            height: 24,
            width: 24,
            child: Image.asset(
              "assets/images/video_content/more_vert.png",
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
