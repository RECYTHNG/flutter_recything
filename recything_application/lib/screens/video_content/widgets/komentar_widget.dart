import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class KomentarWidget extends StatelessWidget {
  const KomentarWidget(
      {super.key,
      required this.name,
      required this.kometar,
      required this.image,
      this.height,
      this.width,
      required this.crossAxisAlignment,
      this.margin});
  final String name;
  final String kometar;
  final ImageProvider<Object> image;
  final double? height;
  final double? width;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 2,
        right: 2,
        top: 2,
      ),
      child: Container(
        margin: margin,
        alignment: Alignment.topLeft,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: image,
                ),
                shape: BoxShape.circle,
              ),
            ),
            SpacingConstant.horizontalSpacing200,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyleConstant.semiboldCaption.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  ),
                  SpacingConstant.verticalSpacing050,
                  Text(
                    kometar,
                    style: TextStyleConstant.regularCaption.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
