import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/shadow_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/homepage/home_navbar_screen.dart';

class AppBarCategoryRecycleWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCategoryRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.primaryColor500,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        boxShadow: ShadowConstant.shadowMd,
      ),
      child: AppBar(
        iconTheme: const IconThemeData(color: ColorConstant.netralColor50),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: ColorConstant.netralColor50,
                        size: 24,
                      ),
                      onPressed: () => Get.off(() => HomeNavBarScreen(currentIndex: 1)),
                    ),
                    const Spacer(),
                    Text(
                      'Kategori Daur Ulang',
                      style: TextStyleConstant.boldSubtitle.copyWith(
                        color: ColorConstant.netralColor50,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(
                      width: 30,
                      height: 30,
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

  @override
  Size get preferredSize => const Size.fromHeight(130);
}
