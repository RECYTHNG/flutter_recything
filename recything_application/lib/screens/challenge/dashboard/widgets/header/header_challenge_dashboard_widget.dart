import 'package:flutter/material.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/screens/challenge/dashboard/widgets/header/card_header_challenge_dashboard_widget.dart';
import 'package:recything_application/screens/challenge/dashboard/widgets/header/profile_header_challenge_dashboard_widget.dart';

class HeaderChallengeDashboardWidget extends StatelessWidget {
  const HeaderChallengeDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            ImageConstant.backgroundDashboard,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          right: 16,
          top: 30,
          child: Image.asset(
            ImageConstant.logoBackgroundDashboard,
            width: 125,
            height: 24,
          ),
        ),
        const ProfileHeaderChallengeDashboardWidget(),
        const CardHeaderMissionDashboardWidget(),
      ],
    );
  }
}
