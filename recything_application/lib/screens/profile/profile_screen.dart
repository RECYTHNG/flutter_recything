import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/profile_controller.dart';
import 'package:recything_application/screens/profile/widget/menu_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text(
                "Profile Pengguna",
                style: TextStyleConstant.boldSubtitle
                    .copyWith(color: ColorConstant.netralColor900),
              ),
              SpacingConstant.verticalSpacing400,
              Row(
                children: [
                  SizedBox(
                    height: 95,
                    width: 95,
                    child: Stack(
                      children: [
                        Obx(
                          () {
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: profileController.image.value.isEmpty
                                      ? const AssetImage(
                                          "assets/images/profile/icon_person.png")
                                      : NetworkImage(
                                          profileController.image.value),
                                ),
                                shape: BoxShape.circle,
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Basic dialog title'),
                                    actions: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                        child: const Text('Gallery'),
                                        onPressed: () {
                                          profileController.uploadAndgetImage(
                                              ImageSource.gallery);
                                          Get.back();
                                        },
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                        child: const Text('Camera'),
                                        onPressed: () {
                                          profileController.uploadAndgetImage(
                                              ImageSource.camera);
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                color: ColorConstant.netralColor500,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                  "assets/images/profile/icon_edit.png"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SpacingConstant.horizontalSpacing400,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tatiana Septimus",
                        style: TextStyleConstant.semiboldParagraph.copyWith(
                          color: ColorConstant.netralColor900,
                        ),
                      ),
                      SpacingConstant.verticalSpacing100,
                      Text(
                        "tatianaseptimus@gmail.com",
                        style: TextStyleConstant.regularParagraph.copyWith(
                          color: ColorConstant.netralColor600,
                        ),
                      ),
                      SpacingConstant.verticalSpacing100,
                      Text(
                        "Lengkapi Profil",
                        style: TextStyleConstant.boldCaption.copyWith(
                          color: ColorConstant.infoColor500,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SpacingConstant.verticalSpacing400,
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
              const MenuWidget(
                assetName2: "assets/images/profile/navigate_next_red.png",
                assetName: "assets/images/profile/logout.png",
                data: "Log Out",
                textColor: ColorConstant.dangerColor500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
