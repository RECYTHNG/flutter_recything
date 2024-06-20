import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/screens/authentication/login/login_screen.dart';
import 'package:recything_application/screens/profile/widget/menu_widget.dart';
import 'package:recything_application/utils/shared_pref.dart';

class ListMenuWidget extends StatelessWidget {
  const ListMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MenuWidget(
          assetName2: "assets/images/profile/navigate_next.png",
          assetName: "assets/images/profile/help_outline.png",
          data: "Pusat Bantuan",
          textColor: ColorConstant.netralColor900,
        ),
        SpacingConstant.verticalSpacing200,
        const Divider(
          thickness: 0.5,
        ),
        SpacingConstant.verticalSpacing200,
        const MenuWidget(
          assetName2: "assets/images/profile/navigate_next.png",
          assetName: "assets/images/profile/for_you.png",
          data: "About Us",
          textColor: ColorConstant.netralColor900,
        ),
        SpacingConstant.verticalSpacing200,
        const Divider(
          thickness: 0.5,
        ),
        SpacingConstant.verticalSpacing200,
        GestureDetector(
          onTap: () {
            SharedPref.removeToken();
            Get.off(
              () => LoginAuthenticationScreen(),
            );
          },
          child: const MenuWidget(
            assetName2: "assets/images/profile/navigate_next_red.png",
            assetName: "assets/images/profile/logout.png",
            data: "Log Out",
            textColor: ColorConstant.dangerColor500,
          ),
        ),
      ],
    );
  }
}
