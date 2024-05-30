import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class NotFoundSearchResultWidget extends StatelessWidget {
  const NotFoundSearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/search/not_found.png',
          width: 268,
        ),
        const SizedBox(height: 5),
        Text(
          'Waduhh, pencarianmu tidak ada nih!',
          style: TextStyleConstant.boldParagraph.copyWith(
            color: ColorConstant.netralColor900,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          'Kami tidak mendapatkan apa yang kamu maksud :(',
          style: TextStyleConstant.mediumCaption.copyWith(
            color: ColorConstant.netralColor900,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          'Lakukan Search ulang, yuk!',
          style: TextStyleConstant.boldCaption.copyWith(
            color: ColorConstant.netralColor900,
          ),
        )
      ],
    );
  }
}
