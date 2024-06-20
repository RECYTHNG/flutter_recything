import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recything_application/constants/icon_constant.dart';

class IconDecorationDashboardReportingWidget extends StatelessWidget {
  const IconDecorationDashboardReportingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 225,
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
          child: SvgPicture.asset(
            IconConstant.reporting,
          ),
        ),
      ),
    );
  }
}
