import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';

class HeaderReportHistoryDetailWidget extends StatelessWidget {
  const HeaderReportHistoryDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        width: double.infinity,
        height: 110,
        decoration: const BoxDecoration(
          color: ColorConstant.primaryColor500,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
