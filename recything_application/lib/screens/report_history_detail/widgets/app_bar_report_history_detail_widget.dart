import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/report_history_controller.dart';

class AppBarReportHistoryDetailWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarReportHistoryDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportHistoryController controller = Get.find();
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ColorConstant.primaryColor500,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ColorConstant.whiteColor,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const Spacer(),
                  Text(
                    controller.selectedHistory.value!.reportType == 'rubbish'
                        ? 'Laporan Penumpukan Sampah'
                        : 'Laporan Sampah Sembarangan',
                    style: TextStyleConstant.boldSubtitle.copyWith(
                      color: ColorConstant.netralColor50,
                    ),
                  ),
                  const Spacer(),
                  SpacingConstant.horizontalSpacing200,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(106);
}
