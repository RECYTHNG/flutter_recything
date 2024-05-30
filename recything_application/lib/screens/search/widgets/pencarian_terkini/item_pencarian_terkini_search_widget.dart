import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ItemPencarianTerkiniSearchWidget extends StatelessWidget {
  const ItemPencarianTerkiniSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Pembuangan Sampah',
          style: TextStyleConstant.mediumCaption.copyWith(
            color: ColorConstant.netralColor600,
          ),
        ),
        SvgPicture.asset(
          ImageConstant.iconDelete,
          width: 8,
          height: 8,
        ),
      ],
    );
  }
}
