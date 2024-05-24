import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const GlobalAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstant.whiteColor,
      toolbarHeight: 62,
      title: title,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
