import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/lottie_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/user_controller.dart';
import 'package:recything_application/screens/homepage/home_navbar_screen.dart';
import 'package:recything_application/screens/profile/profile_screen.dart';
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
            Text(
              'Edit Profil Sukses',
              textAlign: TextAlign.center,
              style: TextStyleConstant.boldTitle.copyWith(
                color: ColorConstant.netralColor900,
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
            Text(
              'Datamu Berhasil Diperbarui!',
              textAlign: TextAlign.center,
              style: TextStyleConstant.boldSubtitle.copyWith(
                color: ColorConstant.netralColor900,
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
                  fontSize: 12.0,
                ),
              ),
            ),
            SpacingConstant.verticalSpacing1000,
            GlobalButtonWidget(
              onTap: () {
                Get.delete<UserController>();
                Get.offAll(
                  () => HomeNavBarScreen(
                    currentIndex: 0,
                  ),
                );
              },
              width: double.infinity,
              height: 60,
              backgroundColor: ColorConstant.primaryColor500,
              isBorder: false,
              title: 'Home',
              textColor: ColorConstant.whiteColor,
              fontSize: 14,
            ),
            SpacingConstant.verticalSpacing200,
            GlobalButtonWidget(
              onTap: () {
                Get.delete<UserController>();
                Get.offAll(() => ProfileScreen());
              },
              width: double.infinity,
              height: 60,
              backgroundColor: ColorConstant.whiteColor,
              isBorder: true,
              borderColor: ColorConstant.primaryColor500,
              title: 'Cek Profil',
              textColor: ColorConstant.primaryColor500,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
