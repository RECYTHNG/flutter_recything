import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class TambahPoinButton extends StatelessWidget {
  final VoidCallback onPressed;

  const TambahPoinButton({
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
          backgroundColor: ColorConstant.primaryColor500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Tambah Poin',
          style: TextStyleConstant.regularSubtitle.copyWith(
            color: ColorConstant.whiteColor,
          ),
        ),
      ),
    );
  }
}
