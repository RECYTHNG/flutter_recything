import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/models/achievement_model.dart';
import 'package:recything_application/services/achievement/achievement_service.dart';

class PlatinumAchievementContent extends StatefulWidget {
  const PlatinumAchievementContent({super.key});

  @override
  State<PlatinumAchievementContent> createState() =>
      _PlatinumAchievementContentState();
}

class _PlatinumAchievementContentState
    extends State<PlatinumAchievementContent> {
  bool isLoading = false;
  AchievementModel? achievementResult;

  Future<void> getAchievement() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await AchievementService().getAchievement();
      setState(() {
        isLoading = false;
        achievementResult = result;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAchievement();
  }

  @override
  Widget build(BuildContext context) {
    int currentPoint = achievementResult?.data?.dataUser?.point ?? 0;
    int levelPoint =
        achievementResult?.data?.dataAchievement?[3].targetPoint ?? 0;
    int targetPoint = 600000;
    double progressValue = (targetPoint > 0) ? currentPoint / targetPoint : 0;
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
                        ColorConstant.primaryColor300,
                        ColorConstant.primaryColor300.withOpacity(0.95),
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
                          'Platinum',
                          style: TextStyleConstant.semiboldHeading4.copyWith(
                            fontSize: 18.0,
                            color: ColorConstant.whiteColor,
                          ),
                        ),
                        SpacingConstant.verticalSpacing100,
                        Text(
                          'Bersama di puncak kepedulian, \nmenciptakan dunia yang lebih hijau.',
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
                              '$levelPoint Poin',
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
                        achievementResult != null &&
                                achievementResult!.data != null &&
                                achievementResult!.data!.dataUser != null &&
                                achievementResult!.data!.dataUser!.point! >=
                                    targetPoint
                            ? SvgPicture.asset(
                                width: 18.01,
                                height: 24,
                                IconConstant.unlockAchievement,
                              )
                            : achievementResult != null &&
                                    achievementResult!.data != null &&
                                    achievementResult!.data!.dataUser != null &&
                                    achievementResult!.data!.dataUser!.point! <=
                                        levelPoint
                                ? SvgPicture.asset(
                                    width: 18.01,
                                    height: 24,
                                    IconConstant.lockAchievement,
                                  )
                                : SvgPicture.asset(
                                    width: 18.01,
                                    height: 24,
                                    IconConstant.achievementIcon,
                                  ),
                        SpacingConstant.horizontalSpacing100,
                        Text(
                          achievementResult != null &&
                                  achievementResult!.data != null &&
                                  achievementResult!.data!.dataUser != null &&
                                  achievementResult!.data!.dataUser!.point! >=
                                      targetPoint
                              ? 'Lencana ini sudah kamu dapatkan'
                              : achievementResult != null &&
                                      achievementResult!.data != null &&
                                      achievementResult!.data!.dataUser !=
                                          null &&
                                      achievementResult!
                                              .data!.dataUser!.point! <=
                                          levelPoint
                                  ? 'Poin Kamu Belum Cukup'
                                  : 'Level Lencana Anda Saat Ini',
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
                  '$currentPoint Poin',
                  style: TextStyleConstant.boldHeading4.copyWith(
                    fontSize: 20.0,
                    color: ColorConstant.netralColor900,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SpacingConstant.verticalSpacing100,
                LinearProgressIndicator(
                  minHeight: 8.0,
                  value: progressValue,
                  backgroundColor: ColorConstant.netralColor500,
                  borderRadius: BorderRadius.circular(40.0),
                  color: ColorConstant.primaryColor300,
                ),
                SpacingConstant.verticalSpacing100,
                Text(
                  currentPoint >= targetPoint
                      ? 'Poin kamu sudah melewati batas level lencana ini'
                      : currentPoint <= levelPoint
                          ? 'Poin kamu belum cukup untuk level lencana ini'
                          : 'Poin kamu telah selesai berada di level lencana ini',
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
                        'Lihat Semua',
                        style: TextStyleConstant.boldCaption.copyWith(
                          color: ColorConstant.infoColor500,
                        ),
                      ),
                    ),
                  ],
                ),
                SpacingConstant.verticalSpacing100,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 100.0,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '+ 3000 poin',
                                style: TextStyleConstant.mediumCaption.copyWith(
                                  color: ColorConstant.secondaryColor500,
                                ),
                              ),
                              SpacingConstant.verticalSpacing300,
                              Text(
                                '12 Hari Lalu Terselesaikan',
                                style: TextStyleConstant.mediumCaption.copyWith(
                                  color: ColorConstant.secondaryColor500,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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
                      children: [
                        Container(
                          height: 52.0,
                          width: 52.0,
                          decoration: const BoxDecoration(
                            color: ColorConstant.primaryColor300,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              IconConstant.poinkuPlatinumAchievement,
                            ),
                          ),
                        ),
                        SpacingConstant.horizontalSpacing200,
                        Text(
                          'Dapatkan Bonus Poin 25% dari \nmissions yang kamu selesaikan',
                          style: TextStyleConstant.mediumCaption
                              .copyWith(color: ColorConstant.netralColor900),
                        )
                      ],
                    ),
                    SpacingConstant.verticalSpacing100,
                    Row(
                      children: [
                        Container(
                          height: 52.0,
                          width: 52.0,
                          decoration: const BoxDecoration(
                            color: ColorConstant.primaryColor300,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              IconConstant.poinkuPlatinumAchievement,
                            ),
                          ),
                        ),
                        SpacingConstant.horizontalSpacing200,
                        Text(
                          'Dapatkan Bonus Poin 25% dari \nmissions yang kamu selesaikan',
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
