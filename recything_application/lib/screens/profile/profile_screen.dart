import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/profile/widget/menu_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/profile/icon_person.png"),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(6),
                            height: 35,
                            width: 35,
                            decoration: const BoxDecoration(
                              color: ColorConstant.netralColor500,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                                "assets/images/profile/icon_edit.png"),
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
