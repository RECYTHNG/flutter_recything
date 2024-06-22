import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/models/challenge/dashboard/user_dashboard_challenge_model.dart';

class TwoStepperWidget extends StatelessWidget {
  final Datum datum;
  final String finalStatus;
  const TwoStepperWidget({
    super.key,
    required this.datum,
    required this.finalStatus,
  });

  @override
  Widget build(BuildContext context) {
    Color finalColor;
    if (finalStatus == 'Proses') {
      finalColor = ColorConstant.primaryColor500;
    } else if (finalStatus == 'Menunggu') {
      finalColor = ColorConstant.primaryColor400;
    } else if (finalStatus == 'Ditolak') {
      finalColor = ColorConstant.dangerColor500;
    } else if (finalStatus == 'Terverifikasi') {
      finalColor = ColorConstant.secondaryColor500;
    } else {
      finalColor = const Color(0XFF9F9F9F);
    }
    List<bool> stepData = datum.taskChallenge.userSteps.map((item) => item.completed).toList();
    stepData.sort((a, b) => (a == b ? 0 : (a ? -1 : 1)));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            // NOTE: first step
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: stepData[0] ? Colors.transparent : finalColor,
                ),
                color: stepData[0] ? finalColor : ColorConstant.whiteColor,
              ),
              child: Center(
                child: finalStatus == 'Ditolak'
                      ? const Icon(Icons.close, size: 12, color: ColorConstant.whiteColor)
                      : stepData[0]
                          ? const Icon(Icons.check, size: 12, color: ColorConstant.whiteColor)
                          : const Icon(Icons.circle,size: 7, color: ColorConstant.primaryColor500),
              ),
            ),
            SpacingConstant.verticalSpacing050,
            Text(
              'Step 1',
              style: TextStyleConstant.mediumFooter.copyWith(
                color: ColorConstant.netralColor900,
              ),
            ),
          ],
        ),
        // NOTE: first line
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 18,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    decoration: BoxDecoration(
                      color: stepData[0] ? finalColor : const Color(0XFF9F9F9F),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // NOTE: second step
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: stepData[0] ? finalColor : stepData[1] ? Colors.transparent : const Color(0XFF9F9F9F),
                ),
                color: stepData[1] ? finalColor : ColorConstant.whiteColor,
              ),
              child: Center(
                child: finalStatus == 'Ditolak'
                        ? const Icon(Icons.close, size: 12, color: ColorConstant.whiteColor)
                        : stepData[1]
                            ? const Icon(Icons.check, size: 12, color: ColorConstant.whiteColor)
                            : Icon(Icons.circle, size: 7, color: stepData[0] ? ColorConstant.primaryColor500 : const Color(0XFF9F9F9F)),
              ),
            ),
            SpacingConstant.verticalSpacing050,
            Text(
              'Step 2',
              style: TextStyleConstant.mediumFooter.copyWith(
                color: ColorConstant.netralColor900,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
