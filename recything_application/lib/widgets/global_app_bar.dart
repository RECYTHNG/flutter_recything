import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Color backgroundColor;

  const GlobalAppBar(
      {super.key, required this.title, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 62,
      backgroundColor: backgroundColor,
      title: title,
      centerTitle: true,
      titleTextStyle: TextStyleConstant.boldSubtitle.copyWith(
        color: ColorConstant.netralColor900,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
