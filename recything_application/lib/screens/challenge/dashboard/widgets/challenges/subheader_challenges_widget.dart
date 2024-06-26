import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/screens/challenge/challenge_list/challenge_list_screen.dart';
import 'package:recything_application/widgets/global_subheader_widget.dart';

class SubheaderChallengesWidget extends StatelessWidget {
  const SubheaderChallengesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalSubheaderWidget(
      title: 'Challenges',
      description: 'Challenges yang Bisa Kamu Ikuti',
      onTap: () => Get.to(
        () => const ChallengeListScreen(),
      ),
    );
  }
}
