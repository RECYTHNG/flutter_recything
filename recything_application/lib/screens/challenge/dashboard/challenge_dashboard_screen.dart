import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';
import 'package:recything_application/screens/challenge/dashboard/widgets/challenges/list_challenges_widget.dart';
import 'package:recything_application/screens/challenge/dashboard/widgets/challenges/subheader_challenges_widget.dart';
import 'package:recything_application/screens/challenge/dashboard/widgets/header/header_challenge_dashboard_widget.dart';
import 'package:recything_application/screens/challenge/dashboard/widgets/my_challenge/item_my_challenge_widget.dart';
import 'package:recything_application/screens/challenge/dashboard/widgets/my_challenge/subheader_my_challenge_widget.dart';
import 'package:recything_application/utils/system_ui_overlay_utils.dart';

class ChallengeDashboardScreen extends StatelessWidget {
  const ChallengeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChallengeDashboardController());
    SystemUiOverlayUtils().setSystemUiOverlay(ColorConstant.netralColor900, false);
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderChallengeDashboardWidget(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Column(
                  children: [
                    SpacingConstant.verticalSpacing300,
                    const SubheaderMyChallengeWidget(),
                    SpacingConstant.verticalSpacing150,
                    const ItemMyChallengeWidget(),
                    SpacingConstant.verticalSpacing300,
                    const SubheaderChallengesWidget(),
                    SpacingConstant.verticalSpacing150,
                    const ListChallengesWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
