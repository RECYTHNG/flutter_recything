import 'package:flutter/material.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/screens/challenge_dashboard/widgets/challenges/item_challenges_widget.dart';
import 'package:recything_application/screens/challenge_dashboard/widgets/challenges/subheader_challenges_widget.dart';
import 'package:recything_application/screens/challenge_dashboard/widgets/header/header_mission_dashboard_widget.dart';
import 'package:recything_application/screens/challenge_dashboard/widgets/my_challenge/item_my_challenge_widget.dart';
import 'package:recything_application/screens/challenge_dashboard/widgets/my_challenge/subheader_my_challenge_widget.dart';

class MissionDashboardScreen extends StatelessWidget {
  const MissionDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderMissionDashboardWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SpacingConstant.verticalSpacing300,
                    const SubheaderMyChallengeWidget(),
                    const SizedBox(height: 10),
                    const ItemMyChallengeWidget(),
                    const SizedBox(height: 25),
                    const SubheaderChallengesWidget(),
                    const SizedBox(height: 10),
                    const ItemChallengesWidget()
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