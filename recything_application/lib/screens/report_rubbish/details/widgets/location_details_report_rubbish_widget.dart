import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class LocationDetailsReportRubbishWidget extends StatelessWidget {
  const LocationDetailsReportRubbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lokasi Sampah',
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor900,
          ),
        ),
        const GlobalSearchBar(
          hintText: 'Search',
          height: 40,
          width: double.infinity,
        ),
      ],
    );
  }
}
