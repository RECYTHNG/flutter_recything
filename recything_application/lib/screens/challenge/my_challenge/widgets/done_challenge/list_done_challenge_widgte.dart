import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';
import 'package:recything_application/screens/challenge/widgets/item_user_challenge_widget.dart';

class ListDoneChallengeWidget extends StatelessWidget {
  const ListDoneChallengeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChallengeDashboardController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16
      ),
      child: Column(
        children: [
          SpacingConstant.verticalSpacing200,
          Expanded(
            child: ListView.separated(
              itemCount: controller.onProgressChallengeData.value!.data.length,
              separatorBuilder: (context, index) => SpacingConstant.verticalSpacing100,
              itemBuilder: (context, index) {
                final challenge = controller.onProgressChallengeData.value!.data[index];
                return ItemUserChallengeWidget(
                  title: challenge.taskChallenge.title,
                  status: 'Status',
                  totalStep: challenge.taskChallenge.taskSteps.length,
                  image: 'https://s3-alpha-sig.figma.com/img/65f8/8658/19f102ef2baaa4b0ccde60dd99e7f5ed?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jQSpQKYZqBLoq0-Nih9g0ZXiknbYrbzNQEMoVLjsCy4haA9FxKulODUc9xeSl7KjPF3Z4~90HlDcCDmWDreuCE5riZ8gh-qikeSVlu3hprxf0ncJgjJVP6-NgTGr5wMIq-2jCoyi0dlUWbCmGHgon4BlngTjCasAdLrFythvnexMVRWKYRhScbeyYdbxttcJ-y9VHXcJZNTE1s7AM4FzunfITmmTjwJa~Rqc6XR4TX9~39oiclrJ3TcnvbZKdIi1QGTJxifAWGpOP7wnFV~XP2Dm-MevqBJAWjO8nQPkN4UHisKiyIVxgdfWrJk04Re-PFm9DLlK7W94oOAPrN-akw__',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
