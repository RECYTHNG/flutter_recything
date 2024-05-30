import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ButtonChallengeWidget extends StatelessWidget {
  final bool challengeStarted;
  final int currentStep;
  final bool isUploadButton;
  final bool proofUpload;
  final String statusChallenge;
  final VoidCallback onPressed;

  const ButtonChallengeWidget({
    super.key,
    required this.challengeStarted,
    required this.currentStep,
    required this.isUploadButton,
    required this.proofUpload,
    required this.statusChallenge,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    String buttonText;
    if (statusChallenge == "Ditolak") {
      buttonText = 'Perbaiki Bukti';
    } else if (proofUpload) {
      buttonText = 'Home';
    } else if (challengeStarted) {
      if (isUploadButton) {
        buttonText = 'Upload Bukti';
      } else {
        buttonText = 'Selesai Step ${currentStep + 1}';
      }
    } else {
      buttonText = 'Mulai Tantangan';
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstant.primaryColor500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyleConstant.semiboldButton.copyWith(
            color: ColorConstant.whiteColor,
          ),
        ),
      ),
    );
  }
}
