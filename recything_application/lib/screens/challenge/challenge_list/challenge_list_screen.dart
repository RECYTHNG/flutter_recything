import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';
import 'package:recything_application/screens/challenge/challenge_list/widgets/challenge_list_widget.dart';
import 'package:recything_application/screens/challenge/challenge_list/widgets/header_challenge_list_widget.dart';
import 'package:recything_application/screens/challenge/challenge_list/widgets/subheader_challenge_widget.dart';

class ChallengeListScreen extends StatelessWidget {
  const ChallengeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChallengeDashboardController controller = Get.find();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchAllChallenge();
      controller.fetchUserAchievement();
    });
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: ColorConstant.netralColor50,
        ),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Challenges',
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor50,
            fontFamily: 'Nunito',
          ),
        ),
        backgroundColor: ColorConstant.primaryColor500,
      ),
      backgroundColor: ColorConstant.primaryColor50,
      body: const SafeArea(
        child: Column(
          children: [
            HeaderChallengeListWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      SubheaderChallengeWidget(),
                      SizedBox(height: 16),
                      ChallengeListWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
