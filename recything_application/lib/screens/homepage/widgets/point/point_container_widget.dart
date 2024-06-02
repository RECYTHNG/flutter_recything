import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

class PointsContainer extends StatelessWidget {
  const PointsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.primaryColor400,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      height: 180,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Poin',
                  style: TextStyleConstant.semiboldCaption.copyWith(
                    color: ColorConstant.whiteColor,
                  ),
                ),
                SvgPicture.asset(
                  IconConstant.badgeClassic,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                '0',
                style: TextStyleConstant.semiboldHeading3.copyWith(
                  color: ColorConstant.whiteColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GlobalButtonWidget(
                  onTap: () {},
                  width: 150,
                  height: 40,
                  backgroundColor: ColorConstant.primaryColor500,
                  isBorder: false,
                  title: "Tambah Poin",
                  textColor: ColorConstant.whiteColor,
                  fontSize: 16,
                ),
                GlobalButtonWidget(
                  onTap: () {},
                  width: 150,
                  height: 40,
                  backgroundColor: ColorConstant.whiteColor,
                  isBorder: false,
                  title: "Riwayat",
                  textColor: ColorConstant.primaryColor500,
                  fontSize: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
