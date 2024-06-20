import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class HeaderReportRubbishWidget extends StatelessWidget {
  const HeaderReportRubbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: double.infinity,
          height: 195,
        ),
        Container(
          padding: const EdgeInsets.only(top: 15),
          width: double.infinity,
          height: 157,
          decoration: const BoxDecoration(
            color: Color(0xff00476D),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Row(
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
        ),
        Positioned(
          top: 120,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xff7FB23B),
              border: Border.all(
                color: const Color(0xffFFFFFF),
                width: 8,
                strokeAlign: 0,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(IconConstant.reporting),
            ),
          ),
        )
      ],
    );
  }
}
