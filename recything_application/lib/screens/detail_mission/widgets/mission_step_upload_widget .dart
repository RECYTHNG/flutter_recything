import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/shadow_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class MissionStepUploadWidget extends StatelessWidget {
  // final String progress;

  const MissionStepUploadWidget({
    super.key,
    // required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: 'progress' == 'done'
            ? ColorConstant.successColor50
            : ColorConstant.whiteColor,
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
                SvgPicture.asset('progress' == 'done'
                    ? IconConstant.iconStatusDone
                    : IconConstant.iconStatusProcess),
              ],
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
