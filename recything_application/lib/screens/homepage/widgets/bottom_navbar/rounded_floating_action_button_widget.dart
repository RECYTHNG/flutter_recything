import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';

class RoundedFloatingActionButton extends StatelessWidget {
  const RoundedFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 24,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstant.primaryColor500,
          width: 10,
        ),
        shape: BoxShape.circle,
      ),
      child: Material(
        elevation: 12,
        shadowColor: ColorConstant.whiteColor,
        shape: const CircleBorder(),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: ColorConstant.whiteColor,
          onPressed: () {},
          child: const Icon(
            Icons.volume_mute_rounded,
            color: ColorConstant.primaryColor500,
            size: 32,
          ),
        ),
      ),
    );
  }
}
