import 'package:flutter/material.dart';
import 'package:horizontal_stepper_flutter/horizontal_stepper_flutter.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/models/challenge/dashboard/user_dashboard_challenge_model.dart';
import 'package:recything_application/screens/challenge/widgets/stepper/five_stepper_widget.dart';
import 'package:recything_application/screens/challenge/widgets/stepper/four_stepper_widget.dart';
import 'package:recything_application/screens/challenge/widgets/stepper/three_stepper_widget.dart';
import 'package:recything_application/screens/challenge/widgets/stepper/two_stepper_widget.dart';
import 'package:recything_application/utils/status_challenge_utils.dart';

class ItemUserChallengeWidget extends StatelessWidget {
  final String title;
  final int totalStep;
  final String image;
  final Datum datum;
  final Function() onTap;
  final String statusProgress;
  final String statusAccept;
  const ItemUserChallengeWidget({
    super.key,
    required this.title,
    required this.totalStep,
    required this.image,
    required this.datum,
    required this.onTap,
    required this.statusProgress,
    required this.statusAccept,
  });

  @override
  Widget build(BuildContext context) {
    final String finalStatus = StatusChallengeUtils.getStatus(statusProgress, statusAccept);
    String finalStatusMessage;
    Color finalColorInstruction;
    if (finalStatus == 'Proses') {
      finalStatusMessage = 'Ayo segera lanjutkan challenge ini';
      finalColorInstruction = ColorConstant.primaryColor500;
    } else if (finalStatus == 'Menunggu') {
      finalStatusMessage = 'Menunggu verifikasi admin';
      finalColorInstruction = ColorConstant.primaryColor400;
    } else if (finalStatus == 'Ditolak') {
      finalStatusMessage =
          'Bukti foto tidak sesuai step. Segera Perbaiki Bukti!';
      finalColorInstruction = ColorConstant.dangerColor500;
    } else if (finalStatus == 'Terverifikasi') {
      finalStatusMessage = 'Selamat! Challenge Selesai';
      finalColorInstruction = ColorConstant.secondaryColor500;
    } else {
      finalStatusMessage = 'Status tidak diketahui';
      finalColorInstruction = const Color(0XFF9F9F9F);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 264,
        decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff64646F).withOpacity(0.2),
              offset: const Offset(0, 7),
              blurRadius: 29,
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 160,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: Image.network(
                      image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 110,
                    ),
                    height: 38,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9).withOpacity(0.7),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyleConstant.semiboldParagraph.copyWith(
                              color: ColorConstant.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 24,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: const BoxDecoration(
                      color: ColorConstant.primaryColor500,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        finalStatus,
                        style: TextStyleConstant.semiboldCaption.copyWith(
                          color: ColorConstant.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  SpacingConstant.verticalSpacing200,
                  if (totalStep == 2)
                    const TwoStepperWidget()
                  else if (totalStep == 3)
                    ThreeStepperWidget(datum: datum, finalStatus: finalStatus)
                  else if (totalStep == 4)
                    const FourStepperWidget()
                  else
                    const FiveStepperWidget(),
                  SpacingConstant.verticalSpacing200,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        finalStatusMessage,
                        style: TextStyleConstant.regularFooter
                            .copyWith(color: finalColorInstruction),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
