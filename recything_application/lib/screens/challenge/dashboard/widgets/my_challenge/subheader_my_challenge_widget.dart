import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/screens/challenge/my_challenge/my_challenge_screen.dart';
import 'package:recything_application/widgets/global_subheader_widget.dart';

class SubheaderMyChallengeWidget extends StatelessWidget {
  const SubheaderMyChallengeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalSubheaderWidget(
      title: 'My Challenge',
      description: 'Challenge yang Sedang Kamu Ikuti',
      onTap: () => Get.to(() => const MyChallengeScreen()),
    );
  }
}