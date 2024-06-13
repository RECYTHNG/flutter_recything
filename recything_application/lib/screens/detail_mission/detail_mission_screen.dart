import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/doing_task_detail_mission_controller.dart';
import 'package:recything_application/screens/detail_mission/widgets/mission_header_widget.dart';
import 'package:recything_application/screens/detail_mission/widgets/mission_step_widget.dart';
import 'package:recything_application/screens/detail_mission/widgets/status_detail_mission_widget.dart';
import 'package:recything_application/screens/detail_mission/widgets/button_challenge_widget.dart';
import 'package:recything_application/utils/date_time_utils.dart';

class DetailMissionScreen extends StatelessWidget {
  final String taskId;

  DetailMissionScreen({super.key, required this.taskId}) {
    Get.put(DoingTaskDetailMissionController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoingTaskDetailMissionController>(
      initState: (_) {
        Get.find<DoingTaskDetailMissionController>().getData(taskId);
      },
      builder: (controller) {
        final data = controller.data;

        if (data == null || data.isEmpty) {
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
              child: Text(
                'Data not available.',
                style: TextStyleConstant.semiboldTitle,
              ),
            ),
          );
        }

        final batasAkhirChallenge =
            DateTimeUtils(dateTimeStringInput: data['end_date']);

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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MissionHeader(
                    imageUrl: data['thumbnail'],
                    pointChallenge: data['point'].toString(),
                  ),
                  const SizedBox(height: 12),
                  StatusDetailMissionWidget(
                    status: data['status'] ? 'Bisa Diikuti' : 'Inactive',
                  ),
                  const SizedBox(height: 16),
                  Text(
                    data['title'],
                    style: TextStyleConstant.semiboldHeading4,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data['description'],
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
                    itemCount: data['task_steps'].length,
                    itemBuilder: (context, index) {
                      final step = data['task_steps'][index];
                      return MissionStepWidget(
                        index: index,
                        title: step['title'],
                        description: step['description'],
                        progress:
                            'Not Started', // You can adjust this as needed
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  ButtonChallengeWidget(
                    challengeStarted: false,
                    currentStep: 0,
                    isUploadButton: false,
                    proofUpload: false,
                    statusChallenge: '',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
