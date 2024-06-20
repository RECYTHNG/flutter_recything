import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/lottie_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/map_rubbish_controller.dart';

class ConfirmationBottomsheetReportRubbishWidget extends StatelessWidget {
  const ConfirmationBottomsheetReportRubbishWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MapRubbishController controller = Get.find();
    return Container(
      height: 415,
      decoration: const BoxDecoration(
        color: ColorConstant.netralColor50,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 4,
              decoration: const BoxDecoration(
                  color: ColorConstant.netralColor600,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            SpacingConstant.verticalSpacing300,
            Lottie.asset(
              LottieConstant.verify,
              width: 192,
              height: 174,
              repeat: false,
            ),
            SpacingConstant.verticalSpacing075,
            Text(
              'Apakah kamu yakin untuk \nmelaporkannya?',
              textAlign: TextAlign.center,
              style: TextStyleConstant.boldParagraph.copyWith(
                color: ColorConstant.netralColor900,
              ),
            ),
            SpacingConstant.verticalSpacing300,
            GestureDetector(
              onTap: () => controller.sendRubbishReport(controller),
              child: Container(
                width: 170,
                height: 44,
                decoration: const BoxDecoration(
                  color: ColorConstant.primaryColor500,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Ya, Kirimkan Laporan!',
                    style: TextStyleConstant.semiboldButton.copyWith(
                      color: ColorConstant.netralColor50,
                    ),
                  ),
                ),
              ),
            ),
            SpacingConstant.verticalSpacing100,
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: 170,
                height: 44,
                decoration: const BoxDecoration(
                  color: ColorConstant.primaryColor500,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Edit Kembali Laporan',
                    style: TextStyleConstant.semiboldButton.copyWith(
                      color: ColorConstant.netralColor50,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
