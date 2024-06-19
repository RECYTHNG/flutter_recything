import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/shadow_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class MissionStepUploadWidget extends StatelessWidget {
  final String progress;
  final String statusProgress;
  final String statusAccepted;

  const MissionStepUploadWidget({
    super.key,
    required this.progress,
    required this.statusProgress,
    required this.statusAccepted,
  });

  @override
  Widget build(BuildContext context) {
    Color _getContainerColor(String statusProgress, String statusAccepted) {
      switch (statusProgress) {
        case 'done':
          switch (statusAccepted) {
            case 'need_review':
              return ColorConstant.warningColor50;
            case 'accept':
              return ColorConstant
                  .successColor50; // You might need to define this color
            case 'reject':
              return ColorConstant
                  .dangerColor50; // You might need to define this color
            default:
              return ColorConstant.whiteColor;
          }
        case 'in_progress':
          return ColorConstant
              .whiteColor; // You might need to define this color
        default:
          return ColorConstant.whiteColor;
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: _getContainerColor(statusProgress, statusAccepted),
        borderRadius: BorderRadius.circular(12),
        boxShadow: ShadowConstant.shadowMd,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: ColorConstant.whiteColor,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: ColorConstant.netralColor600,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Unggah Semua Bukti',
                  style: TextStyleConstant.semiboldSubtitle.copyWith(
                    color: ColorConstant.netralColor900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 8),
                  width: 300,
                  child: Text(
                    'Unggah foto sesuai step yang telah kamu kerjakan, isi deskripsi, tunggu verifikasi admin, dan dapatkan poin!',
                    style: TextStyleConstant.regularCaption,
                  ),
                ),
                Builder(
                  builder: (context) {
                    switch (statusProgress) {
                      case 'done':
                        switch (statusAccepted) {
                          case 'need_rivew':
                            return SvgPicture.asset(
                                IconConstant.iconStatusWaitingAcc);
                          case 'accept':
                            return SvgPicture.asset(
                                IconConstant.iconStatusProcess);
                          case 'reject':
                            return SvgPicture.asset(
                                IconConstant.iconStatusReject);
                          default:
                            return SvgPicture.asset(
                                IconConstant.iconStatusProcess);
                        }
                      case 'in_progress':
                        return SvgPicture.asset(IconConstant.iconStatusProcess);
                      default:
                        return SvgPicture.asset(IconConstant.iconStatusProcess);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
