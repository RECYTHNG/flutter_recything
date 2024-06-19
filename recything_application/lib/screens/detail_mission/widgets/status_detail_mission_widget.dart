import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class StatusDetailMissionWidget extends StatelessWidget {
  final String statusProgress;
  final String statusAccepted;

  const StatusDetailMissionWidget(
      {required this.statusProgress, super.key, required this.statusAccepted});

  Color _getBackgroundColor() {
    switch (statusProgress) {
      case 'ready':
        return ColorConstant.infoColor500;
      case 'in_progress':
        return ColorConstant.primaryColor500;
      case 'done':
        switch (statusAccepted) {
          case 'need_rivew':
            return ColorConstant.primaryColor400;
          case 'accept':
            return ColorConstant.secondaryColor500;
          case 'reject':
            return ColorConstant.dangerColor500;
          default:
            return ColorConstant.primaryColor500;
        }
      default:
        return ColorConstant.primaryColor500;
    }
  }

  String _getTitleText() {
    switch (statusProgress) {
      case 'ready':
        return 'Bisa Diikuti';
      case 'in_progress':
        return 'Proses';
      case 'done':
        switch (statusAccepted) {
          case 'need_rivew':
            return 'Menunggu';
          case 'accept':
            return 'Diterima';
          case 'reject':
            return 'Ditolak';
          default:
            return 'Proses';
        }
      default:
        return 'Proses';
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
            _getTitleText(),
            style: TextStyleConstant.semiboldCaption.copyWith(
              color: ColorConstant.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
