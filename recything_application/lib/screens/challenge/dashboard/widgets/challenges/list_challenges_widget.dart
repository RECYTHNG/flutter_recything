import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';
import 'package:recything_application/models/challenge/dashboard/all_dashboard_challenge_model.dart';
import 'package:recything_application/screens/challenge/widgets/item_challenge_widget.dart';
import 'package:recything_application/screens/detail_mission/detail_mission_start_screen.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ListChallengesWidget extends StatelessWidget {
  const ListChallengesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChallengeDashboardController controller = Get.find();
    return Obx(
      () {
        if (controller.isLoadingFetchAllChallenge.value) {
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
          final List<Datum> listChallenge = controller.challengeData.value!.data.take(3).toList();
          return SizedBox(
            height: 140,
            child: ListView.separated(
              separatorBuilder: (context, index) => SpacingConstant.horizontalSpacing250,
              shrinkWrap: true,
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: listChallenge.length,
              itemBuilder: (context, index) {
                final data = listChallenge[index];
                return ItemChallengeWidget(
                  onTap: () {
                    Get.to(
                      DetailMissionStartScreen(taskId: data.id),
                    );
                  },
                  width: 390,
                  point: data.point.toString(),
                  title: data.title,
                  image: data.thumbnail,
                  index: index,
                );
              },
            ),
          );
        }
      },
    );
  }
}
