import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/report_litter_controller.dart';

class LitterTypeBottomSheet extends StatelessWidget {
  final ReportLitterController controller = Get.find<ReportLitterController>();

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
            'Ubah Jenis Sampah',
            style: TextStyleConstant.semiboldHeading4,
            textAlign: TextAlign.center,
          ),
          SpacingConstant.verticalSpacing200,
          _buildLitterTypeOption(
            'assets/images/report_litter/organic.png',
            'Organik',
            controller.litterType.value == 'Organik',
            context,
          ),
          SpacingConstant.verticalSpacing200,
          _buildLitterTypeOption(
            'assets/images/report_litter/anorganic.png',
            'Anorganik',
            controller.litterType.value == 'Anorganik',
            context,
          ),
          SpacingConstant.verticalSpacing200,
          _buildLitterTypeOption(
            'assets/images/report_litter/danger.png',
            'Berbahaya',
            controller.litterType.value == 'Berbahaya',
            context,
          ),
        ],
      ),
    );
  }

  Widget _buildLitterTypeOption(
      String imagePath, String label, bool isActive, BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.litterType.value = label;
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isActive ? ColorConstant.netralColor500 : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  imagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                SpacingConstant.horizontalSpacing100,
                Text(
                  label,
                  style: TextStyleConstant.regularSubtitle,
                ),
              ],
            ),
            if (isActive)
              const Icon(
                Icons.check_circle,
                color: ColorConstant.successColor500,
              ),
          ],
        ),
      ),
    );
  }
}
