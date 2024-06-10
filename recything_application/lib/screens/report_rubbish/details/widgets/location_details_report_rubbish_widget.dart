import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/report_rubbish_controller.dart';
import 'package:recything_application/screens/report_rubbish/maps/maps_report_rubbish_screen.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class LocationDetailsReportRubbishWidget extends StatelessWidget {
  const LocationDetailsReportRubbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportRubbishController controller = Get.put(ReportRubbishController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lokasi Sampah',
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor900,
          ),
        ),
        SpacingConstant.verticalSpacing100,
        GestureDetector(
          onTap: () => Get.to(const MapsReportRubbishScreen()),
          child: Stack(
            children: [
              GlobalSearchBar(
                hintText: 'Search',
                height: 40,
                width: double.infinity,
                controller: controller.searchController,
              ),
              Positioned(
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
