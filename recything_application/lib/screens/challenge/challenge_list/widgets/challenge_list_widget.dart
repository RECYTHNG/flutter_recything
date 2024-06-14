import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';
import 'package:recything_application/screens/challenge/widgets/item_challenge_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ChallengeListWidget extends StatelessWidget {
  const ChallengeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChallengeDashboardController controller = Get.find();
    return Obx(
      () {
        if (controller.isLoadingFetchAllChallenge.value) {
          return Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyLoading(),
                ],
              ),
            ),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.challengeData.value!.data.length,
            itemBuilder: (context, index) {
              final challenge = controller.challengeData.value!.data[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ItemChallengeWidget(
                  point: challenge.point.toString(),
                  title: challenge.title,
                  image: 'https://s3-alpha-sig.figma.com/img/65f8/8658/19f102ef2baaa4b0ccde60dd99e7f5ed?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jQSpQKYZqBLoq0-Nih9g0ZXiknbYrbzNQEMoVLjsCy4haA9FxKulODUc9xeSl7KjPF3Z4~90HlDcCDmWDreuCE5riZ8gh-qikeSVlu3hprxf0ncJgjJVP6-NgTGr5wMIq-2jCoyi0dlUWbCmGHgon4BlngTjCasAdLrFythvnexMVRWKYRhScbeyYdbxttcJ-y9VHXcJZNTE1s7AM4FzunfITmmTjwJa~Rqc6XR4TX9~39oiclrJ3TcnvbZKdIi1QGTJxifAWGpOP7wnFV~XP2Dm-MevqBJAWjO8nQPkN4UHisKiyIVxgdfWrJk04Re-PFm9DLlK7W94oOAPrN-akw__',
                  index: index,
                ),
              );
            },
          );
        }
      },
    );
  }
}
