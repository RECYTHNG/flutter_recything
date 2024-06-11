import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/models/achievement_model.dart';
import 'package:recything_application/screens/halaman_riwayat/point_history_screen.dart';
import 'package:recything_application/services/achievement/achievement_service.dart';

class ClassicAchievementContent extends StatefulWidget {
  const ClassicAchievementContent({super.key});

  @override
  State<ClassicAchievementContent> createState() =>
      _ClassicAchievementContentState();
}

class _ClassicAchievementContentState extends State<ClassicAchievementContent> {
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
        achievementResult?.data?.dataAchievement?[0].targetPoint ?? 0;
    int targetPoint =
        achievementResult?.data?.dataAchievement?[1].targetPoint ?? 0;
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
                        const Color(0xFF4F3415),
                        const Color(0xFF4F3415).withOpacity(0.95),
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
                  color: const Color(0xFF4F3415),
                ),
                SpacingConstant.verticalSpacing100,
                Text(
                  currentPoint >= targetPoint
                      ? 'Poin kamu sudah melewati batas level lencana ini'
                      : '${targetPoint - currentPoint} Poin lagi untuk kamu menjadi level silver',
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
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PointHisstoryScreen(),
                          ),
                        );
                      },
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
                      itemCount:
                          achievementResult?.data?.historyUserPoint?.length ??
                              0,
                      itemBuilder: (context, index) {
                        var historyItem =
                            achievementResult?.data?.historyUserPoint?[index];
                        if (historyItem == null) {
                          return SizedBox(
                            child: Center(
                              child: Text(
                                'Data tidak ditemukan',
                                style: TextStyleConstant.boldCaption.copyWith(
                                  color: ColorConstant.netralColor700,
                                ),
                              ),
                            ),
                          );
                        }

                        DateTime parsedDate = DateTime.parse(historyItem.date!);
                        Duration difference =
                            DateTime.now().difference(parsedDate);
                        int daysAgo = difference.inDays;

                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '+ ${historyItem.points} Poin',
                                style: TextStyleConstant.mediumCaption.copyWith(
                                  color: ColorConstant.secondaryColor500,
                                ),
                              ),
                              SpacingConstant.verticalSpacing300,
                              Text(
                                '$daysAgo Hari Lalu Terselesaikan',
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
                            color: Color(0xFF4F3415),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              IconConstant.poinkuClassicAchievement,
                            ),
                          ),
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
                      children: [
                        Container(
                          height: 52.0,
                          width: 52.0,
                          decoration: const BoxDecoration(
                            color: Color(0xFF4F3415),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              IconConstant.poinkuClassicAchievement,
                            ),
                          ),
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