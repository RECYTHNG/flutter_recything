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
    Map<String, dynamic> _getCase(
        String statusProgress, String statusAccepted) {
      switch (statusProgress) {
        case 'done':
          switch (statusAccepted) {
            case 'need_review':
              return {
                "title": 'Bukti Sudah Diunggah',
                "description": 'Bukti Sedang Diverifikasi admin.',
                "color": ColorConstant.warningColor50,
                "icon": IconConstant.iconStatusWaitingAcc,
              };
            case 'accept':
              return {
                "title": 'Bukti Terverifikasi',
                "description": 'Bukti sudah disetujui admin',
                'color': ColorConstant.successColor50,
                "icon": IconConstant.iconStatusDone,
              };
            case 'reject':
              return {
                "title": 'Bukti Ditolak',
                "description":
                    'Beberapa foto Bukti blur. Segera Perbaiki Bukti.',
                'color': ColorConstant.dangerColor50,
                "icon": IconConstant.iconStatusReject,
              };
            default:
              return {
                "title": 'Bukti Sudah Diunggah',
                "description": 'Bukti Sedang Diverifikasi admin.',
                'color': ColorConstant.warningColor50,
                "icon": IconConstant.iconStatusWaitingAcc,
              };
          }
        case 'in_progress':
          return {
            "title": 'Unggah Semua Bukti',
            "description":
                'Unggah foto sesuai step yang telah kamu kerjakan, isi deskripsi, tunggu verifikasi admin, dan dapatkan poin!',
            'color': ColorConstant.whiteColor,
            "icon": IconConstant.iconStatusProcess,
          };
        default:
          return {
            "title": 'Unggah Semua Bukti',
            "description":
                'Unggah foto sesuai step yang telah kamu kerjakan, isi deskripsi, tunggu verifikasi admin, dan dapatkan poin!',
            'color': ColorConstant.whiteColor,
            "icon": IconConstant.iconStatusProcess,
          };
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: _getCase(statusProgress, statusAccepted)['color'],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 13,
            spreadRadius: -2,
            color: ColorConstant.blackColor.withOpacity(0.15),
          )
        ],
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
                  _getCase(statusProgress, statusAccepted)['title'],
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
                    _getCase(statusProgress, statusAccepted)['description'],
                    style: TextStyleConstant.regularCaption,
                  ),
                ),
                SvgPicture.asset(
                  _getCase(statusProgress, statusAccepted)['icon'],
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
