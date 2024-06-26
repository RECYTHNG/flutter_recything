import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/doing_task_detail_mission_controller.dart';
import 'package:recything_application/screens/detail_mission/detail_mission_progress_screen.dart';

class ButtonStartChallengeWidget extends StatelessWidget {
  final String taskId;
  final RxMap<dynamic, dynamic> dataTask;

  const ButtonStartChallengeWidget({
    super.key,
    required this.taskId,
    required this.dataTask,
  });

  @override
  Widget build(BuildContext context) {
    final DoingTaskDetailMissionController controller =
        Get.find<DoingTaskDetailMissionController>();

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          try {
            // Post taskId with empty data
            await controller.startTask(taskId, dataTask);
            final userTaskId = controller.dataGetStartTask['id'];
            if (userTaskId != null) {
              Get.to(() => DetailMissionProgressScreen(userTaskId: userTaskId));
            } else {
              if (kDebugMode) {
                print('Failed to start task');
              }
            }
          } catch (e) {
            if (kDebugMode) {
              print('Error: $e');
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstant.primaryColor500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Mulai Tantangan',
          style: TextStyleConstant.semiboldButton.copyWith(
            color: ColorConstant.whiteColor,
          ),
        ),
      ),
    );
  }
}
