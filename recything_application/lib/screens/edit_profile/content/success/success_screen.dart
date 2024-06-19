import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/lottie_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/user/user_controller.dart';
import 'package:recything_application/screens/home.dart';
import 'package:recything_application/widgets/global_button_widget.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Edit Profil Sukses',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            SpacingConstant.verticalSpacing1000,
            Lottie.asset(
              LottieConstant.verify,
              height: 312,
              width: 328,
              repeat: false,
            ),
            SpacingConstant.verticalSpacing200,
            const Text(
              'Datamu Berhasil Diperbarui!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            SpacingConstant.verticalSpacing100,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Selamat! Profilmu berhasil diperbarui! Saatnya menjadi pahlawan lingkungan!',
                textAlign: TextAlign.center,
                style: TextStyleConstant.regularSubtitle.copyWith(
                  color: ColorConstant.netralColor600,
                ),
              ),
            ),
            SpacingConstant.verticalSpacing1000,
            GlobalButtonWidget(
                onTap: () {
                  Get.delete<UserController>();
                  Get.offAll(() => const HomeAuthenticationScreen());
                },
                width: double.infinity,
                height: 60,
                backgroundColor: ColorConstant.primaryColor500,
                isBorder: false,
                title: 'Home',
                textColor: ColorConstant.whiteColor,
                fontSize: 20),
            SpacingConstant.verticalSpacing200,
            GlobalButtonWidget(
                onTap: () {
                  Get.delete<UserController>();
                  Get.offAll(() => const HomeAuthenticationScreen());
                },
                width: double.infinity,
                height: 60,
                backgroundColor: ColorConstant.whiteColor,
                isBorder: true,
                borderColor: ColorConstant.primaryColor500,
                title: 'Cek Profil',
                textColor: ColorConstant.primaryColor500,
                fontSize: 20),
          ],
        ),
      ),
    );
  }
}
