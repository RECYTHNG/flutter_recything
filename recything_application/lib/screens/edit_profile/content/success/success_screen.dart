import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor500,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Selamat!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorConstant.whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          SpacingConstant.verticalSpacing1000,
          SvgPicture.asset(ImageConstant.successImage),
          SpacingConstant.verticalSpacing500,
          const Text(
            'Datamu Berhasil Diperbaharui!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorConstant.whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          SpacingConstant.verticalSpacing1000,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstant.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: ColorConstant.primaryColor500,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
