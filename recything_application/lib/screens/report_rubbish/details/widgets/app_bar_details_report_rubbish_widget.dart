import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class AppBarDetailsReportRubbishWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDetailsReportRubbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ColorConstant.primaryColor500,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ColorConstant.whiteColor,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const Spacer(),
                  Text(
                    'Laporan Penumpukan Sampah',
                    style: TextStyleConstant.boldSubtitle.copyWith(
                      color: ColorConstant.netralColor50,
                    ),
                  ),
                  const Spacer(),
                  SpacingConstant.horizontalSpacing600,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(106);
}
