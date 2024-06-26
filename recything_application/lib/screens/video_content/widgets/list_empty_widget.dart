import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ItemListEmpty extends StatelessWidget {
  const ItemListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          children: [
            Container(
              height: 248,
              width: 280,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/video_content/not found.png",
                  ),
                ),
              ),
            ),
            Text(
              "Waduhh, pencarianmu tidak ada nih!",
              style: TextStyleConstant.boldParagraph.copyWith(
                color: ColorConstant.netralColor900,
              ),
            ),
            Text(
              "Kami tidak mendapatkan apa yang kamu maksud :(",
              textAlign: TextAlign.center,
              style: TextStyleConstant.mediumCaption.copyWith(
                color: ColorConstant.netralColor900,
              ),
            ),
            Text(
              "Lakukan Search ulang, yuk!",
              style: TextStyleConstant.boldCaption.copyWith(
                color: ColorConstant.netralColor900,
              ),
            )
          ],
        ),
      ),
    );
  }
}
