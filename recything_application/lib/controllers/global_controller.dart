import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/screens/splash/splash_screen.dart';

class GlobalController extends GetxController {
  void showExpiredSessionDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Sesi Berakhir'),
        content: const Text('Sesi kamu sudah berakhir:( Silakan login kembali'),
        actions: [
          TextButton(
            onPressed: () {
              Get.offAll(() => const SplashScreen());
            },
            child: const Text('Login Ulang'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}