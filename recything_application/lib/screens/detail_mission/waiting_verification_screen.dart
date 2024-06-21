import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/lottie_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/doing_task_detail_mission_controller.dart';
import 'package:recything_application/screens/homepage/home_navbar_screen.dart';

class WaitingVerificationScreen extends StatelessWidget {
  WaitingVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DoingTaskDetailMissionController controller =
        Get.put(DoingTaskDetailMissionController());

    final data = controller.dataGetProgress;
    int pointChallenge = data['task_challenge']['point'];
    print(pointChallenge);
    // final pointChallenge = '3000';
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Tunggu Verifikasi Admin',
                  style: TextStyleConstant.boldTitle.copyWith(
                    color: ColorConstant.netralColor900,
                  ),
                ),
                const SizedBox(height: 40),
                Lottie.asset(LottieConstant.verify, repeat: false, width: 328),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: Column(
                    children: [
                      Text(
                        'Selamat ! Challenge Selesai',
                        style: TextStyleConstant.boldSubtitle.copyWith(
                          color: ColorConstant.netralColor900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tunggu Verifikasi Dari Admin dan Dapatkan Poin Sebesar 3000 poin',
                        style: TextStyleConstant.boldCaption.copyWith(
                          color: ColorConstant.netralColor600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeNavBarScreen(
                                  currentIndex: 0,
                                ),
                              ),
                              ModalRoute.withName('/'),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstant.whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Home',
                            style: TextStyleConstant.semiboldButton.copyWith(
                              color: ColorConstant.primaryColor500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstant.whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Cek Riwayat Poin',
                            style: TextStyleConstant.semiboldButton.copyWith(
                              color: ColorConstant.primaryColor500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
