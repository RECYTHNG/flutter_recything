import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/achievement_controller.dart';
import 'package:recything_application/screens/halaman_riwayat/point_history_screen.dart';

class ListPointAdditionHistoryWidget extends StatelessWidget {
  const ListPointAdditionHistoryWidget({
    super.key,
    required this.achievementController,
  });

  final AchievementController achievementController;

  @override
  Widget build(BuildContext context) {
    final historyUserPoint =
        achievementController.achievementResult.value.data?.historyUserPoint;
    return Column(
      children: [
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
                    builder: (context) => PointHisstoryScreen(),
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
            child: historyUserPoint == null || historyUserPoint.isEmpty
                ? Center(
                    child: Text(
                      'Data tidak ditemukan',
                      style: TextStyleConstant.boldCaption.copyWith(
                        color: ColorConstant.netralColor700,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: achievementController.achievementResult.value
                            .data?.historyUserPoint?.length ??
                        0,
                    itemBuilder: (context, index) {
                      var historyItem = historyUserPoint[index];

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
      ],
    );
  }
}
