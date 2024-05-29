import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class TopThreeLeaderboardItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String score;
  final int rank;
  final String medalAsset;

  const TopThreeLeaderboardItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.score,
    required this.rank,
    required this.medalAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              imageUrl,
              height: rank == 1 ? 80 : 64,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 56),
                  child: Container(
                    alignment: Alignment.center,
                    width: rank == 1 ? 24 : 20,
                    height: rank == 1 ? 24 : 20,
                    decoration: BoxDecoration(
                      color: ColorConstant.infoColor500,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      rank.toString(),
                      style: TextStyleConstant.boldParagraph,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: rank == 1 ? 40 : 32),
                  child: SvgPicture.asset(
                    medalAsset,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          name,
          style: TextStyleConstant.boldParagraph.copyWith(
            color: ColorConstant.whiteColor,
          ),
        ),
        Text(
          score,
          style: TextStyleConstant.regularCaption.copyWith(
            color: ColorConstant.whiteColor,
          ),
        ),
      ],
    );
  }
}
