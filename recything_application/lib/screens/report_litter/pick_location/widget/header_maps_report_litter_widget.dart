import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/screens/report_litter/pick_location/widget/app_bar_maps_report_litter_widget.dart';
import 'package:recything_application/screens/report_litter/pick_location/widget/search_maps_report_litter_widget.dart';

class HeaderMapsReportLitterWidget extends StatelessWidget {
  const HeaderMapsReportLitterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 500,
          width: double.infinity,
        ),
        Container(
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 12.7,
                offset: const Offset(0, 5),
                color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.25),
              ),
            ],
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 16,
            ),
            child: Column(
              children: [
                const AppBarMapsReportLitterWidget(),
                SpacingConstant.verticalSpacing150,
              ],
            ),
          ),
        ),
        const Positioned(
          top: 75,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SearchMapsReportLitterWidget(),
          ),
        ),
      ],
    );
  }
}
