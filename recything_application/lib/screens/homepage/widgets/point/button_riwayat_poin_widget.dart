import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class RiwayatButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RiwayatButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstant.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Riwayat',
          style: TextStyleConstant.regularSubtitle.copyWith(
            color: ColorConstant.primaryColor500,
          ),
        ),
      ),
    );
  }
}
