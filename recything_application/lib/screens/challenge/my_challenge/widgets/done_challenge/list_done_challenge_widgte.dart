import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';
import 'package:recything_application/screens/challenge/widgets/empty_state_challenge_widget.dart';
import 'package:recything_application/screens/challenge/widgets/item_user_challenge_widget.dart';
import 'package:recything_application/screens/detail_mission/detail_mission_progress_screen.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ListDoneChallengeWidget extends StatelessWidget {
  const ListDoneChallengeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChallengeDashboardController controller = Get.find();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchDoneChallenge();
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SpacingConstant.verticalSpacing200,
          Obx(
            () {
              if (controller.isLoadingFetchDoneChallenge.value) {
                return Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyLoading(),
                      ],
                    ),
                  ),
                );
              } else {
                if (controller.doneChallengeData.value == null) {
                  return const EmptyStateChallengeWidget();
                } else {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: controller.doneChallengeData.value!.data.length,
                      separatorBuilder: (context, index) => SpacingConstant.verticalSpacing100,
                      itemBuilder: (context, index) {
                        final challenge = controller.doneChallengeData.value!.data[index];
                        return ItemUserChallengeWidget(
                          onTap: () {
                            Get.to(
                              DetailMissionProgressScreen(userTaskId: challenge.id),
                            );
                          },
                          datum: challenge,
                          title: challenge.taskChallenge.title,
                          statusAccept: challenge.statusAccept,
                          statusProgress: challenge.statusProgress,
                          totalStep: challenge.taskChallenge.taskSteps.length,
                          image: challenge.taskChallenge.thumbnail,
                        );
                      },
                    ),
                  );
                }
              }
            },
          )
        ],
      ),
    );
  }
}
