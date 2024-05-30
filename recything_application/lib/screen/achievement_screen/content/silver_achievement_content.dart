import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class SilverAchievementContent extends StatefulWidget {
  const SilverAchievementContent({super.key});

  @override
  State<SilverAchievementContent> createState() =>
      _SilverAchievementContentState();
}

class _SilverAchievementContentState extends State<SilverAchievementContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: SweepGradient(
                      colors: [
                        const Color(0xFF545454),
                        const Color(0xFF545454).withOpacity(0.75),
                      ],
                      center: const Alignment(-2.5, 0.0),
                      startAngle: 0.0,
                      endAngle: 2 * 3.14159,
                      transform: const GradientRotation(-3.14 / 3),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Classic',
                          style: TextStyleConstant.semiboldHeading4.copyWith(
                            fontSize: 18.0,
                            color: ColorConstant.whiteColor,
                          ),
                        ),
                        SpacingConstant.verticalSpacing100,
                        Text(
                          'Awal yang baik menuju bumi yang lebih \nbersih dan sehat untuk keluarga kita.',
                          style: TextStyleConstant.regularParagraph.copyWith(
                            color: ColorConstant.whiteColor.withOpacity(0.6),
                          ),
                        ),
                        SpacingConstant.verticalSpacing100,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Poin Dibutuhkan',
                              style:
                                  TextStyleConstant.regularParagraph.copyWith(
                                color: ColorConstant.whiteColor,
                              ),
                            ),
                            Text(
                              '0 Poin',
                              style: TextStyleConstant.semiboldTitle.copyWith(
                                color: ColorConstant.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0.0,
                  child: Image.asset(
                    ImageConstant.cardImage,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: ColorConstant.blackColor.withOpacity(0.25),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          width: 18.01,
                          height: 24,
                          IconConstant.achievementIcon,
                        ),
                        SpacingConstant.horizontalSpacing100,
                        Text(
                          'Level Lencana Anda Saat Ini',
                          style: TextStyleConstant.regularParagraph.copyWith(
                            color: ColorConstant.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SpacingConstant.verticalSpacing200,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jumlah Point Kamu Saat Ini',
                  style: TextStyleConstant.boldParagraph.copyWith(
                    color: ColorConstant.netralColor700,
                  ),
                ),
                Text(
                  '10.000 Point',
                  style: TextStyleConstant.boldHeading4.copyWith(
                    fontSize: 20.0,
                    color: ColorConstant.netralColor900,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SpacingConstant.verticalSpacing100,
                LinearProgressIndicator(
                  minHeight: 8.0,
                  value: 0.3,
                  backgroundColor: ColorConstant.netralColor500,
                  borderRadius: BorderRadius.circular(40.0),
                  color: const Color(0xFF545454),
                ),
                SpacingConstant.verticalSpacing100,
                Text(
                  '40.000 Poin lagi untuk kamu menjadi level Silver',
                  style: TextStyleConstant.mediumCaption.copyWith(
                    color: ColorConstant.netralColor600,
                  ),
                ),
                SpacingConstant.verticalSpacing100,
                const Divider(
                  color: Color(0xFFE6E6E6),
                ),
                SpacingConstant.verticalSpacing100,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Riwayat Penambahan Setiap Poinmu',
                      style: TextStyleConstant.boldCaption.copyWith(
                        color: ColorConstant.netralColor700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'See all',
                        style: TextStyleConstant.boldCaption.copyWith(
                          color: ColorConstant.primaryColor500,
                        ),
                      ),
                    ),
                  ],
                ),
                SpacingConstant.verticalSpacing100,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '+3000',
                            style: TextStyleConstant.mediumCaption.copyWith(
                              color: ColorConstant.secondaryColor500,
                            ),
                          ),
                          Text(
                            '12 Hari Lalu Terselesaikan',
                            style: TextStyleConstant.mediumCaption.copyWith(
                              color: ColorConstant.secondaryColor500,
                            ),
                          ),
                        ],
                      ),
                      SpacingConstant.verticalSpacing100,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '+3000',
                            style: TextStyleConstant.mediumCaption.copyWith(
                              color: ColorConstant.secondaryColor500,
                            ),
                          ),
                          Text(
                            '12 Hari Lalu Terselesaikan',
                            style: TextStyleConstant.mediumCaption.copyWith(
                              color: ColorConstant.secondaryColor500,
                            ),
                          ),
                        ],
                      ),
                      SpacingConstant.verticalSpacing100,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '+3000',
                            style: TextStyleConstant.mediumCaption.copyWith(
                              color: ColorConstant.secondaryColor500,
                            ),
                          ),
                          Text(
                            '12 Hari Lalu Terselesaikan',
                            style: TextStyleConstant.mediumCaption.copyWith(
                              color: ColorConstant.secondaryColor500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SpacingConstant.verticalSpacing200,
                Text(
                  'Keuntungan',
                  style: TextStyleConstant.boldSubtitle.copyWith(
                    color: ColorConstant.netralColor900,
                  ),
                ),
                SpacingConstant.verticalSpacing100,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 52.0,
                          width: 52.0,
                          decoration: const BoxDecoration(
                            color: Color(0xFF545454),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.star_rounded,
                              color: ColorConstant.whiteColor),
                        ),
                        SpacingConstant.horizontalSpacing200,
                        Text(
                          'Dapatkan Bonus Poin 10% dari \nmissions yang kamu selesaikan',
                          style: TextStyleConstant.mediumCaption
                              .copyWith(color: ColorConstant.netralColor900),
                        )
                      ],
                    ),
                    SpacingConstant.verticalSpacing100,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 52.0,
                          width: 52.0,
                          decoration: const BoxDecoration(
                            color: Color(0xFF545454),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.star_rounded,
                              color: ColorConstant.whiteColor),
                        ),
                        SpacingConstant.horizontalSpacing200,
                        Text(
                          'Dapatkan Bonus Poin 10% dari \nmissions yang kamu selesaikan',
                          style: TextStyleConstant.mediumCaption
                              .copyWith(color: ColorConstant.netralColor900),
                        )
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
