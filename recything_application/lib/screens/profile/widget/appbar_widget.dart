import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Profil Pengguna",
      style: TextStyleConstant.boldSubtitle.copyWith(
        color: ColorConstant.netralColor900,
        fontFamily: 'Nunito',
      ),
    );
  }
}
