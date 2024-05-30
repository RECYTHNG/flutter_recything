import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class AppBarSearchResultWidget extends StatelessWidget {
  const AppBarSearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      width: double.infinity,
      height: 40,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: ColorConstant.netralColor600,
              ),
            ),
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              colorFilter: const ColorFilter.mode(
                ColorConstant.netralColor900,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 19),
          const GlobalSearchBar(
            width: 325,
            hintText: 'Search',
            height: 40,
          ),
        ],
      ),
    );
  }
}