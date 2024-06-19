import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/profile_controller.dart';
import 'package:recything_application/screens/profile/widget/appbar_widget.dart';
import 'package:recything_application/screens/profile/widget/list_menu_widget.dart';
import 'package:recything_application/screens/profile/widget/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppbarWidget(),
              SpacingConstant.verticalSpacing400,
              ProfileWidget(),
              SpacingConstant.verticalSpacing400,
              const ListMenuWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
