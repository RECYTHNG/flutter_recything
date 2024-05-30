import 'package:flutter/material.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/screens/challenge_dashboard/widgets/header/card_header_mission_dashboard_widget.dart';

class HeaderMissionDashboardWidget extends StatelessWidget {
  const HeaderMissionDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            ImageConstant.headerBackgorundDashboard,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          right: 16,
          top: 31,
          child: Image.asset(ImageConstant.logoBackgroundDashboard),
        ),
        const CardHeaderMissionDashboardWidget(),
      ],
    );
  }
}
