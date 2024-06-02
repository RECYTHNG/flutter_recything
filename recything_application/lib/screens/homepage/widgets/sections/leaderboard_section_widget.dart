import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class LeaderboardSectionWidget extends StatelessWidget {
  const LeaderboardSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 24,
        left: 24,
        top: 24,
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Leaderboard',
                    style: TextStyleConstant.boldSubtitle,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lihat Selengkapnya',
                      style: TextStyleConstant.semiboldCaption.copyWith(
                        color: ColorConstant.primaryColor500,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Ikuti challenge dan rebut posisi tertinggi di leaderboard!',
                style: TextStyleConstant.regularParagraph,
                maxLines: 2,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 197,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorConstant.primaryColor400,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Image.asset(
                    ImageConstant.leaderboardKosong,
                    height: 148,
                  ),
                  Text(
                    'Leaderboard masih kosong. Segera ikuti Challenge dan raih posisi teratas!',
                    style: TextStyleConstant.regularParagraph.copyWith(
                      color: ColorConstant.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
