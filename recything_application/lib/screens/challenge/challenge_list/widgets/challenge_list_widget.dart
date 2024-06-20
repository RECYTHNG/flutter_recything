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
                  onTap: () {},
                  point: challenge.point.toString(),
                  title: challenge.title,
                  index: index,
                  image: challenge.thumbnail,
                ),
              );
            },
          );
        }
      },
    );
  }
}
