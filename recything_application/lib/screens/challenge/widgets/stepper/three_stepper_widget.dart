import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/models/challenge/dashboard/user_dashboard_challenge_model.dart';

class ThreeStepperWidget extends StatelessWidget {
  final Datum datum;
  final String finalStatus;
  const ThreeStepperWidget({
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
    final data = datum.taskChallenge.userSteps;
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: data[0].completed == false ? finalColor : Colors.transparent,
                    ),
                    color: data[0].completed == true ? finalColor : Colors.transparent,
                  ),
                  child: Center(
                    child: data[0].completed == true ?
                    const Icon(
                      Icons.check,
                      size: 12,
                      color: ColorConstant.whiteColor,
                    ) : Icon(
                      Icons.circle,
                      size: 5,
                      color: finalColor,
                    ),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  bottom: 18,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        decoration: BoxDecoration(
                          color: data[0].completed == true ? finalColor : const Color(0XFF9F9F9F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
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
                          color: data[1].completed == true ? finalColor : const Color(0XFF9F9F9F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: data[2].completed == false ? finalColor : Colors.transparent,
                    ),
                    color: data[2].completed == true ? finalColor : Colors.transparent,
                  ),
                  child: Center(
                    child: data[2].completed == true ?
                    const Icon(
                      Icons.check,
                      size: 12,
                      color: ColorConstant.whiteColor,
                    ) : Icon(
                      Icons.circle,
                      size: 5,
                      color: finalColor,
                    ),
                  ),
                ),
                SpacingConstant.verticalSpacing050,
                Text(
                  'Step 3',
                  style: TextStyleConstant.mediumFooter.copyWith(
                    color: ColorConstant.netralColor900,
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          child: Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: data[1].completed == false ? finalColor : Colors.transparent,
                  ),
                  color: data[1].completed == true ? finalColor : ColorConstant.whiteColor,
                ),
                child: Center(
                    child: data[1].completed == true ?
                    const Icon(
                      Icons.check,
                      size: 12,
                      color: ColorConstant.whiteColor,
                    ) : Icon(
                      Icons.circle,
                      size: 5,
                      color: finalColor,
                    ),
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
        ),
      ],
    );
  }
}
