import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class GlobalSubheaderWidget extends StatelessWidget {
  final String title;
  final String description;
  final Function() onTap;

  const GlobalSubheaderWidget({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyleConstant.boldSubtitle,
              ),
              InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                onTap: onTap,
                splashColor: ColorConstant.netralColor600,
                child: Text(
                  'Lihat Semua',
                  style: TextStyleConstant.semiboldCaption.copyWith(
                    color: ColorConstant.primaryColor500,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                description,
                style: TextStyleConstant.regularParagraph,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
