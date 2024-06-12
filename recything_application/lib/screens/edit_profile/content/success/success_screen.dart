import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Image.asset(ImageConstant.successImage),
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
                style: TextStyle(
                  color: ColorConstant.netralColor600,
                  fontSize: 16,
                ),
              ),
            ),
            SpacingConstant.verticalSpacing1000,
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstant.primaryColor500,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: ColorConstant.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SpacingConstant.verticalSpacing200,
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstant.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: ColorConstant.primaryColor500,
                    width: 2,
                  ),
                ),
                child: Text(
                  'Cek Profile',
                  style: TextStyle(
                    color: ColorConstant.primaryColor500,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
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
