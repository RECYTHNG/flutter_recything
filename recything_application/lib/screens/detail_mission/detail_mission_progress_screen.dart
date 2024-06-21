import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/doing_task_detail_mission_controller.dart';
import 'package:recything_application/screens/challenge/my_challenge/my_challenge_screen.dart';
import 'package:recything_application/screens/detail_mission/widgets/mission_header_widget.dart';
import 'package:recything_application/screens/detail_mission/widgets/mission_step_upload_widget%20.dart';
import 'package:recything_application/screens/detail_mission/widgets/mission_step_widget.dart';
import 'package:recything_application/screens/detail_mission/widgets/status_detail_mission_widget.dart';
import 'package:recything_application/screens/detail_mission/widgets/button_challenge_widget.dart';
import 'package:recything_application/utils/date_time_utils.dart';

class DetailMissionProgressScreen extends StatelessWidget {
  final String userTaskId;

  DetailMissionProgressScreen({super.key, required this.userTaskId}) {
    Get.put(DoingTaskDetailMissionController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoingTaskDetailMissionController>(
      initState: (_) {
        Get.find<DoingTaskDetailMissionController>()
            .getDataTaskProgress(userTaskId);
      },
      builder: (controller) {
        return Obx(() {
          if (controller.isLoading.value) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Detail Challenge',
                  style: TextStyleConstant.semiboldTitle.copyWith(
                    color: ColorConstant.whiteColor,
                  ),
                ),
                centerTitle: true,
                backgroundColor: ColorConstant.primaryColor500,
                foregroundColor: ColorConstant.whiteColor,
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          final data = controller.dataGetProgress;

          if (data.isEmpty) {
            return Scaffold(
              backgroundColor: ColorConstant.whiteColor,
              appBar: AppBar(
                leading: Text('2'),
                title: Text(
                  'Detail Challenge',
                  style: TextStyleConstant.semiboldTitle.copyWith(
                    color: ColorConstant.whiteColor,
                  ),
                ),
                centerTitle: true,
                backgroundColor: ColorConstant.primaryColor500,
                foregroundColor: ColorConstant.whiteColor,
              ),
              body: Center(
                child: Text(
                  '',
                  style: TextStyleConstant.semiboldTitle,
                ),
              ),
            );
          }

          final batasAkhirChallenge = DateTimeUtils(
              dateTimeStringInput: data['task_challenge']['end_date']);

          final statusProgress = data['status_progress'];

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.off(
                    const MyChallengeScreen(),
                  );
                },
                icon: const Icon(Icons.arrow_back),
              ),
              title: Text(
                'Detail Challenge',
                style: TextStyleConstant.semiboldTitle.copyWith(
                  color: ColorConstant.whiteColor,
                ),
              ),
              centerTitle: true,
              backgroundColor: ColorConstant.primaryColor500,
              foregroundColor: ColorConstant.whiteColor,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MissionHeader(
                      imageUrl: data['task_challenge']['thumbnail'],
                      pointChallenge:
                          data['task_challenge']['point'].toString(),
                    ),
                    const SizedBox(height: 12),
                    StatusDetailMissionWidget(
                      statusProgress: data['status_progress'],
                      statusAccepted: data['status_accepted'],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      data['task_challenge']['title'],
                      style: TextStyleConstant.semiboldHeading4,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      data['task_challenge']['description'],
                      style: TextStyleConstant.regularParagraph,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Batas Akhir:',
                      style: TextStyleConstant.regularParagraph.copyWith(
                        color: ColorConstant.netralColor600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      batasAkhirChallenge.convertDate(),
                      style: TextStyleConstant.regularParagraph.copyWith(
                        color: ColorConstant.primaryColor500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Divider(),
                    const SizedBox(height: 12),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data['task_challenge']['task_steps'].length,
                      itemBuilder: (context, index) {
                        final step =
                            data['task_challenge']['task_steps'][index];
                        final stepId = step['id'];
                        final isCompleted = controller.isStepCompleted(stepId);
                        final progress = isCompleted ? 'done' : 'progress';
                        return MissionStepWidget(
                          index: index,
                          title: step['title'],
                          description: step['description'],
                          progress: progress,
                        );
                      },
                    ),
                    MissionStepUploadWidget(
                      progress: statusProgress,
                      statusProgress: statusProgress,
                      statusAccepted: data['status_accepted'],
                    ),
                    const SizedBox(height: 12),
                    ButtonChallengeWidget(
                      buttonstepCount: controller.stepCount,
                      userTaskId: data['id'],
                      statusProgress: data['status_progress'],
                      statusAccept: data['status_accepted'],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
