import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/leaderboard/widgets/leaderboard_list_widget.dart';
import 'package:recything_application/screens/leaderboard/widgets/leaderboard_top_three_widget.dart';

class LeaderboardScreen extends StatelessWidget {
  LeaderboardScreen({super.key});

  final List<Map<String, String>> leaderboardList = [
    {
      "nama": "Peter",
      "skor": '150000',
      'imageUrl': 'assets/images/leaderboard/avatar/avatar_2.png'
    },
    {
      "nama": "Vero",
      "skor": '200000',
      'imageUrl': 'assets/images/leaderboard/avatar/avatar_1.png'
    },
    {
      "nama": "Monica",
      "skor": '110000',
      'imageUrl': 'assets/images/leaderboard/avatar/avatar_3.png'
    },
    {
      "nama": "Marvin",
      "skor": '105000',
      'imageUrl': 'assets/images/leaderboard/avatar/avatar_1.png'
    },
    {
      "nama": "Darrell",
      "skor": '104000',
      'imageUrl': 'assets/images/leaderboard/avatar/avatar_1.png'
    },
    {
      "nama": "Dianne",
      "skor": '103000',
      'imageUrl': 'assets/images/leaderboard/avatar/avatar_1.png'
    },
    {
      "nama": "Annette",
      'skor': '102000',
      'imageUrl': 'assets/images/leaderboard/avatar/avatar_1.png'
    },
    {
      "nama": "Savannah",
      'skor': '101000',
      'imageUrl': 'assets/images/leaderboard/avatar/avatar_1.png'
    },
    {
      "nama": "Jenny",
      'skor': '100000',
      'imageUrl': 'assets/images/leaderboard/avatar/avatar_1.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    leaderboardList.sort(
      (a, b) => int.parse(b['skor']!).compareTo(
        int.parse(
          a['skor']!,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor500,
        foregroundColor: ColorConstant.whiteColor,
        title: Text(
          'Leaderboard',
          style: TextStyleConstant.semiboldHeading4.copyWith(
            color: ColorConstant.whiteColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: ColorConstant.primaryColor500,
        ),
        child: leaderboardList.isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/leaderboard/gambar_1.png',
                              height: 148,
                            ),
                            Text(
                              'Leaderboard masih kosong. Segera ikuti Challenge dan raih posisi teratas!',
                              style:
                                  TextStyleConstant.regularParagraph.copyWith(
                                color: ColorConstant.whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstant.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Ikuti Challenge',
                          style: TextStyleConstant.regularTitle.copyWith(
                            color: ColorConstant.primaryColor500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorConstant.primaryColor400,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TopThreeLeaderboardItem(
                              imageUrl: leaderboardList[1]['imageUrl']!,
                              name: leaderboardList[1]['nama']!,
                              score: leaderboardList[1]['skor']!,
                              rank: 2,
                              medalAsset:
                                  'assets/images/leaderboard/medal/silver.svg',
                            ),
                            TopThreeLeaderboardItem(
                              imageUrl: leaderboardList[0]['imageUrl']!,
                              name: leaderboardList[0]['nama']!,
                              score: leaderboardList[0]['skor']!,
                              rank: 1,
                              medalAsset:
                                  'assets/images/leaderboard/medal/gold.svg',
                            ),
                            TopThreeLeaderboardItem(
                              imageUrl: leaderboardList[2]['imageUrl']!,
                              name: leaderboardList[2]['nama']!,
                              score: leaderboardList[2]['skor']!,
                              rank: 3,
                              medalAsset:
                                  'assets/images/leaderboard/medal/bronze.svg',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: ColorConstant.primaryColor400,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        child:
                            LeaderboardList(leaderboardList: leaderboardList),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
