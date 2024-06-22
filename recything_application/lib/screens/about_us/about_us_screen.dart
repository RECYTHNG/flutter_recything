import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';

import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/about_us_controller.dart';

import 'package:recything_application/screens/about_us/widgets/contact_us_content.dart';
import 'package:recything_application/screens/about_us/widgets/kenali_tim_content.dart';
import 'package:recything_application/screens/about_us/widgets/perusahaan_content.dart';
import 'package:recything_application/widgets/global_app_bar.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});
  final AboutUsController aboutUsController = Get.put(AboutUsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: const GlobalAppBar(
        title: Text(
          " About Us",
        ),
        backgroundColor: ColorConstant.whiteColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ContainedTabBarView(
              tabBarViewProperties: const TabBarViewProperties(
                physics: ScrollPhysics(
                  parent: NeverScrollableScrollPhysics(),
                ),
              ),
              callOnChangeWhileIndexIsChanging: true,
              initialIndex: aboutUsController.index.value,
              onChange: (index) {
                if (index == 0) {
                  aboutUsController.index.value == index;
                  aboutUsController.param.value == "perusahaan";
                  aboutUsController.getAboutUs("perusahaan");
                } else if (index == 1) {
                  aboutUsController.index.value == index;
                  aboutUsController.param.value == "tim";
                  aboutUsController.getAboutUs("tim");
                } else {
                  aboutUsController.index.value == index;
                  aboutUsController.param.value == "contact_us";
                  aboutUsController.getAboutUs("contact_us");
                }
              },
              tabBarProperties: TabBarProperties(
                background: Container(
                  color: ColorConstant.whiteColor,
                ),
                labelStyle: TextStyleConstant.boldParagraph.copyWith(
                  color: ColorConstant.netralColor900,
                  fontFamily: 'Nunito',
                ),
                indicatorColor: ColorConstant.primaryColor500,
                unselectedLabelStyle: TextStyleConstant.boldParagraph.copyWith(
                  color: ColorConstant.netralColor600,
                  fontFamily: 'Nunito',
                ),
              ),
              tabs: const [
                Text("Perusahaan"),
                Text("Kenali Tim"),
                Text("Contact Us"),
              ],
              views: [
                PerusahaanContent(),
                KenaliTimContent(),
                ContactUsContent(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
