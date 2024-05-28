import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/homepage/widgets/point/button_riwayat_poin_widget.dart';
import 'package:recything_application/screens/homepage/widgets/point/button_tambah_poin_widget.dart';

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
                  'assets/images/home_images/badges/classic.svg',
                ),
              ],
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                '150.000',
                style: TextStyleConstant.semiboldHeading3.copyWith(
                  color: ColorConstant.whiteColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TambahPoinButton(
                  onPressed: () {},
                ),
                RiwayatButton(
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
