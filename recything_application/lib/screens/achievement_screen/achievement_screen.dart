import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/achievement_screen/content/classic_achievement_content.dart';
import 'package:recything_application/screens/achievement_screen/content/gold_achievement_content.dart';
import 'package:recything_application/screens/achievement_screen/content/platinum_achievement_content.dart';
import 'package:recything_application/screens/achievement_screen/content/silver_achievement_content.dart';

class AchievementScreen extends StatefulWidget {
  const AchievementScreen({super.key});

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              tabs: const [
                Tab(text: 'Classic'),
                Tab(text: 'Silver'),
                Tab(text: 'Gold'),
                Tab(text: 'Platinum'),
              ],
              labelStyle: TextStyleConstant.boldParagraph.copyWith(
                color: ColorConstant.netralColor900,
              ),
              unselectedLabelColor: ColorConstant.netralColor600,
              indicatorColor: ColorConstant.primaryColor500,
              dividerColor: ColorConstant.netralColor500,
              overlayColor: MaterialStateProperty.all<Color>(
                Colors.transparent,
              )),
          title: Text(
            'Lencana Kamu',
            style: TextStyleConstant.boldSubtitle,
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            ClassicAchievementContent(),
            SilverAchievementContent(),
            GoldAchievementContent(),
            PlatinumAchievementContent(),
          ],
        ),
      ),
    );
  }
}
