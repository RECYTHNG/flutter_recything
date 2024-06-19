import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/doing_task_detail_mission_controller.dart';
import 'package:recything_application/screens/detail_mission/proof_upload_screen.dart';

class ButtonChallengeWidget extends StatelessWidget {
  final int buttonstepCount;
  final String userTaskId;

  const ButtonChallengeWidget({
    super.key,
    required this.buttonstepCount,
    required this.userTaskId,
  });

  @override
  Widget build(BuildContext context) {
    final DoingTaskDetailMissionController controller =
        Get.find<DoingTaskDetailMissionController>();

    final buttonUpload = controller.buttonUpload;
    print(buttonUpload);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (buttonUpload) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProofUploadScreen(
                  userTaskId: userTaskId,
                ),
              ),
            );
          } else {
            controller.putTaskStepCompletion(userTaskId);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstant.primaryColor500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          buttonUpload
              ? 'Lanjutkan'
              : 'Selesai Step ${buttonstepCount.toString()}',
          style: TextStyleConstant.semiboldButton.copyWith(
            color: ColorConstant.whiteColor,
          ),
        ),
      ),
    );
  }
}
