import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/shadow_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/recycle/search/search_recycle_screen.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class AppBarDashboardRecycleWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDashboardRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        boxShadow: ShadowConstant.shadowMd,
      ),
      child: AppBar(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Recycle',
                      style: TextStyleConstant.boldSubtitle.copyWith(
                        color: ColorConstant.netralColor900,
                      ),
                    ),
                  ],
                ),
                SpacingConstant.verticalSpacing250,
                Stack(
                  children: [
                    const GlobalSearchBar(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      height: 40,
                      width: double.infinity,
                    ),
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () => Get.to(() => const SearchRecycleScreen()),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
