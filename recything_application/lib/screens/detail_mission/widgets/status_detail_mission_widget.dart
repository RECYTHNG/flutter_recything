import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class StatusDetailMissionWidget extends StatelessWidget {
  final String status;

  const StatusDetailMissionWidget({required this.status, super.key});

  Color _getBackgroundColor() {
    switch (status) {
      case 'Proses':
        return ColorConstant.primaryColor500;
      case 'Menunggu Verifikasi':
        return ColorConstant.primaryColor400;
      case 'Terverifikasi':
        return ColorConstant.secondaryColor500;
      case 'Ditolak':
        return ColorConstant.dangerColor500;
      default:
        return ColorConstant.primaryColor500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            status,
            style: TextStyleConstant.semiboldCaption.copyWith(
              color: ColorConstant.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}