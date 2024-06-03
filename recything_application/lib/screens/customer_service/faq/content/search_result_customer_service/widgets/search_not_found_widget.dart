import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class SearchingNotFoundWidget extends StatelessWidget {
  const SearchingNotFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConstant.searchNotFound,
              width: 200.0,
              height: 200.0,
            ),
            Text(
              'Tidak ada hasil',
              style: TextStyleConstant.boldParagraph.copyWith(
                color: ColorConstant.netralColor900,
              ),
            ),
            Text(
              'Kami tidak mendapatkan apa yang kamu maksud :(',
              style: TextStyleConstant.mediumCaption.copyWith(
                color: ColorConstant.netralColor900,
              ),
            ),
            Text(
              'Lakukan Search ulang, yuk!',
              style: TextStyleConstant.boldCaption.copyWith(
                color: ColorConstant.netralColor900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
