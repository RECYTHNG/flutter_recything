import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

class ConfirmationBottomSheet extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmationBottomSheet({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 108,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: ColorConstant.netralColor600,
            ),
          ),
          SpacingConstant.verticalSpacing300,
          Text(
            'Apakah Anda yakin untuk mengirimkan laporan tersebut?',
            style: TextStyleConstant.semiboldSubtitle,
            textAlign: TextAlign.center,
          ),
          SpacingConstant.verticalSpacing200,
          GlobalButtonWidget(
            backgroundColor: ColorConstant.primaryColor500,
            textColor: ColorConstant.whiteColor,
            onTap: onConfirm,
            width: 160,
            height: 40,
            isBorder: false,
            title: 'Ya, saya yakin',
            fontSize: 16,
          ),
          SpacingConstant.verticalSpacing200,
          GlobalButtonWidget(
            backgroundColor: ColorConstant.whiteColor,
            textColor: ColorConstant.primaryColor500,
            onTap: onCancel,
            width: 160,
            height: 40,
            isBorder: false,
            title: 'Edit Laporan',
            fontSize: 16,
          ),
          SpacingConstant.verticalSpacing200,
        ],
      ),
    );
  }
}
