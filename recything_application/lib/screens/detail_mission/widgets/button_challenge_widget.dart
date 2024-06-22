import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/doing_task_detail_mission_controller.dart';
import 'package:recything_application/screens/detail_mission/proof_upload_screen.dart';
import 'package:recything_application/screens/homepage/home_navbar_screen.dart';
import 'package:recything_application/screens/homepage/homepage_screen.dart';

class ButtonChallengeWidget extends StatelessWidget {
  final String userTaskId;
  final int buttonstepCount;
  final String statusProgress;
  final String statusAccept;

  const ButtonChallengeWidget({
    super.key,
    required this.userTaskId,
    required this.buttonstepCount,
    required this.statusProgress,
    required this.statusAccept,
  });

  @override
  Widget build(BuildContext context) {
    final DoingTaskDetailMissionController controller =
        Get.find<DoingTaskDetailMissionController>();

    final buttonUpload = controller.buttonUpload;
    print(buttonUpload);

    String getButtonText() {
      if (buttonUpload &&
          statusProgress == 'done' &&
          statusAccept == 'reject') {
        return 'Perbaiki Bukti';
      } else if (buttonUpload && statusProgress == 'done') {
        return 'Home';
      } else if (buttonUpload) {
        return 'Lanjutkan';
      } else {
        switch (buttonstepCount) {
          default:
            return 'Selesai Step ${buttonstepCount.toString()}';
        }
      }
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (buttonUpload &&
              statusProgress == 'done' &&
              statusAccept == 'reject') {
            Get.to(
              () => ProofUploadScreen(
                userTaskId: userTaskId,
                statusAccept: statusAccept,
              ),
            );
          } else if (buttonUpload && statusProgress == 'done') {
            Get.offAll(
              () => HomeNavBarScreen(
                currentIndex: 0,
              ),
            );
          } else if (buttonUpload) {
            Get.to(
              () => ProofUploadScreen(
                userTaskId: userTaskId,
                statusAccept: statusAccept,
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
          getButtonText(),
          style: TextStyleConstant.semiboldButton.copyWith(
            color: ColorConstant.whiteColor,
          ),
        ),
      ),
    );
  }
}
