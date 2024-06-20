import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class HeaderHistoryDashboardReportingWidget extends StatelessWidget {
  const HeaderHistoryDashboardReportingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Riwayat Pelaporan',
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor900,
          ),
        ),
      ],
    );
  }
}