import 'package:flutter/material.dart';

import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    required this.assetName,
    required this.data,
    this.textColor,
    required this.assetName2,
  });
  final String assetName;
  final String assetName2;
  final String data;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 26,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            child: Row(
              children: [
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        assetName,
                      ),
                    ),
                  ),
                ),
                SpacingConstant.horizontalSpacing100,
                Text(
                  data,
                  style: TextStyleConstant.semiboldSubtitle.copyWith(
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(assetName2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
