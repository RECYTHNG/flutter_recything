import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class TabBarResultByKeywordWidget extends StatelessWidget {
  const TabBarResultByKeywordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 4,
      indicatorColor: ColorConstant.primaryColor500,
      unselectedLabelColor: ColorConstant.netralColor600,
      labelPadding: const EdgeInsets.symmetric(vertical: 10),
      labelStyle: TextStyleConstant.boldParagraph.copyWith(
        color: ColorConstant.netralColor900,
        fontFamily: 'Nunito',
      ),
      unselectedLabelStyle: TextStyleConstant.boldParagraph.copyWith(
        color: ColorConstant.netralColor600,
        fontFamily: 'Nunito',
      ),
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return ColorConstant.primaryColor200.withOpacity(0.2);
          }
          return null;
        },
      ),
      tabs: const [
        Text('Artikel'),
        Text('Video'),
      ],
    );
  }
}
