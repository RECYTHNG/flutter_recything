import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';
import 'package:recything_application/screens/challenge/widgets/empty_state_challenge_widget.dart';
import 'package:recything_application/screens/challenge/widgets/item_user_challenge_widget.dart';
import 'package:recything_application/screens/detail_mission/detail_mission_progress_screen.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ItemMyChallengeWidget extends StatelessWidget {
  const ItemMyChallengeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChallengeDashboardController controller = Get.find();
    return Obx(
      () {
        if (controller.isLoadingFetchOnProgressChallenge.value) {
          return const SizedBox(
            height: 140,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyLoading(),
                ],
              ),
            ),
          );
        } else {
          if (controller.onProgressChallengeData.value == null) {
            return const EmptyStateChallengeWidget(
              width: 245,
              height: 0.2,
              fontSize: 12,
            );
          } else {
            final data = controller.onProgressChallengeData.value!.data[0];
            return ItemUserChallengeWidget(
              onTap: () {
                Get.to(
                  DetailMissionProgressScreen(userTaskId: data.id),
                );
              },
              title: data.taskChallenge.title,
              statusAccept: data.statusAccept,
              statusProgress: data.statusProgress,
              totalStep: data.taskChallenge.taskSteps.length,
              image: data.taskChallenge.thumbnail,
              datum: data,
            );
          }
        }
      },
    );
  }
}
