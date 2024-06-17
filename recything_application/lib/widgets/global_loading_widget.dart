import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 30.0,
      height: 30.0,
      child: CircularProgressIndicator(
        color: ColorConstant.primaryColor500,
        strokeWidth: 1.5,
        backgroundColor: ColorConstant.primaryColor50,
      ),
    );
  }
}
