import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/homepage/home_navbar_screen.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: () {
          Get.offAll(() => HomeNavBarScreen(currentIndex: 1));
        },
        child: Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorConstant.netralColor500,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const Icon(Icons.search),
                const SizedBox(width: 8),
                Text(
                  'cari artikel, video',
                  style: TextStyleConstant.regularSubtitle.copyWith(
                    color: ColorConstant.netralColor700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
