import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class CurrentPointWidget extends StatelessWidget {
  const CurrentPointWidget({
    super.key,
    required this.currentPoint,
    required this.progressValue,
    required this.targetPoint,
    required this.levelPoint,
    required this.colorProgressBar,
    required this.difference,
  });

  final int currentPoint;
  final double progressValue;
  final int targetPoint;
  final int levelPoint;
  final String difference;
  final Color? colorProgressBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jumlah Point Kamu Saat Ini',
          style: TextStyleConstant.boldParagraph.copyWith(
            color: ColorConstant.netralColor700,
          ),
        ),
        Text(
          '$currentPoint Poin',
          style: TextStyleConstant.boldHeading4.copyWith(
            fontSize: 20.0,
            color: ColorConstant.netralColor900,
            fontWeight: FontWeight.w700,
          ),
        ),
        SpacingConstant.verticalSpacing100,
        LinearProgressIndicator(
          minHeight: 8.0,
          value: progressValue,
          backgroundColor: ColorConstant.netralColor500,
          borderRadius: BorderRadius.circular(40.0),
          color: colorProgressBar,
        ),
        SpacingConstant.verticalSpacing100,
        Text(
          currentPoint >= targetPoint
              ? 'Poin kamu sudah melewati batas level lencana ini'
              : currentPoint <= levelPoint
                  ? 'Poin kamu belum cukup untuk level lencana ini'
                  : difference,
          style: TextStyleConstant.mediumCaption.copyWith(
            color: ColorConstant.netralColor600,
          ),
        ),
      ],
    );
  }
}
