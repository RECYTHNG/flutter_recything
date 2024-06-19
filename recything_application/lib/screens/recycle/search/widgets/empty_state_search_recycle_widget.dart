import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class EmptyStateSearchRecycleWidget extends StatelessWidget {
  const EmptyStateSearchRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImageConstant.emptyStateSearch,
          width: 328,
        ),
        SpacingConstant.verticalSpacing100,
        Text(
          'Belum ada riwayat pencarian',
          style: TextStyleConstant.mediumCaption
              .copyWith(color: ColorConstant.netralColor600),
        )
      ],
    );
  }
}
