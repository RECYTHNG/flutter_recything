import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';
import 'package:recything_application/screens/challenge/my_challenge/widgets/active_challenge/list_active_challenge_widget.dart';
import 'package:recything_application/screens/challenge/my_challenge/widgets/done_challenge/list_done_challenge_widgte.dart';

class MyChallengeScreen extends StatelessWidget {
  const MyChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChallengeDashboardController controller = Get.find();
    WidgetsBinding.instance.addPostFrameCallback((_){
      controller.fetchOnProgressChallenge();
      controller.fetchDoneChallengeSection();
    });
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorConstant.primaryColor50,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: ColorConstant.netralColor50,
          ),
          title: Text(
            'My Challenge',
            style: TextStyleConstant.boldSubtitle.copyWith(
              color: ColorConstant.netralColor50,
              fontFamily: 'Nunito',
            ),
          ),
          backgroundColor: ColorConstant.primaryColor500,
          centerTitle: true,
        ),
        body: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 1,
              indicatorColor: ColorConstant.primaryColor500,
              unselectedLabelColor: ColorConstant.netralColor600,
              labelPadding: const EdgeInsets.symmetric(vertical: 10),
              labelStyle: TextStyleConstant.semiboldSubtitle.copyWith(
                color: ColorConstant.primaryColor500,
                fontFamily: 'Nunito',
              ),
              unselectedLabelStyle: TextStyleConstant.semiboldSubtitle.copyWith(
                color: ColorConstant.netralColor600,
                fontFamily: 'Nunito',
              ),
              overlayColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.pressed)) {
                    return ColorConstant.primaryColor200.withOpacity(0.2);
                  }
                  return null;
                },
              ),
              tabs: const [
                Text('Aktif'),
                Text('Selesai'),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ListActiveChallengeWidget(),
                  ListDoneChallengeWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
