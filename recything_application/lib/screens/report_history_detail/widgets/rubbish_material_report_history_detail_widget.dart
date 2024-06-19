import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/report_history_controller.dart';
import 'package:recything_application/screens/report_history_detail/widgets/container_content_report_history_detail_widget.dart';
import 'package:recything_application/screens/report_history_detail/widgets/item_container_report_history_detail_widget.dart';

class RubbishMaterialReportHistoryDetailWidget extends StatelessWidget {
  const RubbishMaterialReportHistoryDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportHistoryController controller = Get.find();
    return ContainerContentReportHistoryDetailWidget(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informasi Tipe Sampah',
            style: TextStyleConstant.boldParagraph.copyWith(
              color: ColorConstant.netralColor900,
            ),
          ),
          SpacingConstant.verticalSpacing075,
          Obx(() {
            return Wrap(
              spacing: 12,
              runSpacing: 6,
              children: [
                ...controller.selectedHistory.value!.wasteMaterials.map((item) {
                  return ItemContainerReportHistoryDetailWidget(
                    name: toBeginningOfSentenceCase(item.type),
                  );
                }),
              ],
            );
          }),
        ],
      ),
    );
  }
}
