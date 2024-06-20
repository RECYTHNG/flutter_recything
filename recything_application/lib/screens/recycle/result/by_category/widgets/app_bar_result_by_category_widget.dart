import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class AppBarResultByCategoryWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarResultByCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ColorConstant.netralColor900,
                      size: 24,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  SpacingConstant.horizontalSpacing100,
                  Expanded(
                    child: Stack(
                      children: [
                        GlobalSearchBar(
                          controller: controller.searchByCategoryController,
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search',
                          height: 40,
                          width: 500,
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
