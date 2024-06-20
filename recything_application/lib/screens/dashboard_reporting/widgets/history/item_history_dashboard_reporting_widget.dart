import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ItemHistoryDashboardReportingWidget extends StatelessWidget {
  final String reportType;
  final String status;
  final String date;
  final String time;
  final Function() onTap;
  const ItemHistoryDashboardReportingWidget({
    super.key,
    required this.reportType,
    required this.status,
    required this.date,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: status == 'need review'
                      ? ColorConstant.warningColor500
                      : status == 'approve'
                          ? ColorConstant.successColor500
                          : ColorConstant.dangerColor500,
                  width: 1,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  reportType == 'rubbish'
                      ? ImageConstant.rubbishHistory
                      : ImageConstant.litteringHistory,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SpacingConstant.horizontalSpacing150,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reportType == 'rubbish'
                        ? 'Tumpukan Sampah'
                        : 'Buang Sampah Sembarangan',
                    style: TextStyleConstant.boldParagraph.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  ),
                  Text(
                    '$date | $time',
                    style: TextStyleConstant.mediumCaption.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  ),
                ],
              ),
            ),
            SpacingConstant.horizontalSpacing150,
            Container(
              width: 64,
              height: 25,
              decoration: BoxDecoration(
                color: status == 'need review'
                    ? ColorConstant.warningColor50
                    : status == 'approve'
                        ? ColorConstant.successColor50
                        : ColorConstant.dangerColor50,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Center(
                child: Text(
                  status == 'need review'
                      ? 'Proses'
                      : status == 'approve'
                          ? 'Diterima'
                          : 'Ditolak',
                  style: TextStyleConstant.boldCaption.copyWith(
                    color: status == 'need review'
                        ? ColorConstant.warningColor500
                        : status == 'approve'
                            ? ColorConstant.successColor500
                            : ColorConstant.dangerColor500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
