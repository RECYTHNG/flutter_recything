import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';
import 'package:recything_application/screens/challenge/widgets/empty_state_challenge_widget.dart';
import 'package:recything_application/screens/challenge/widgets/item_user_challenge_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ListDoneChallengeWidget extends StatelessWidget {
  const ListDoneChallengeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChallengeDashboardController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SpacingConstant.verticalSpacing200,
          Obx(
            () {
              if (controller.isLoadingFetchHistoryChallenge.value ||
                  controller.isLoadingFetchDoneChallenge.value) {
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
                if (controller.doneChallengeSectionData.value!.isNotEmpty) {
                  return Expanded(
                    child: ListView.separated(
                      itemCount:
                          controller.doneChallengeSectionData.value!.length,
                      separatorBuilder: (context, index) =>
                          SpacingConstant.verticalSpacing100,
                      itemBuilder: (context, index) {
                        final challenge =
                            controller.doneChallengeSectionData.value!;
                        return ItemUserChallengeWidget(
                          onTap: () {},
                          datum: challenge[index],
                          title: challenge[index].taskChallenge.title,
                          statusAccept: challenge[index].statusAccept,
                          statusProgress: challenge[index].statusProgress,
                          totalStep: challenge[index].taskChallenge.taskSteps.length,
                          image: challenge[index].taskChallenge.thumbnail,
                        );
                      },
                    ),
                  );
                } else {
                  return const EmptyStateChallengeWidget();
                }
              }
            },
          )
        ],
      ),
    );
  }
}
