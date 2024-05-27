import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.imageAsset, required this.text});
  final String imageAsset;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 95,
      decoration: BoxDecoration(
        color: ColorConstant.netralColor500,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 16,
            width: 16,
            child: Image.asset(imageAsset),
          ),
          Text(
            text,
            style: TextStyleConstant.semiboldParagraph
                .copyWith(color: ColorConstant.primaryColor500),
          )
        ],
      ),
    );
  }
}
