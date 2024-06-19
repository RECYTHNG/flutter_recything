import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/report_history_controller.dart';
import 'package:recything_application/screens/report_history_detail/widgets/container_content_report_history_detail_widget.dart';

class ConditionReportHistoryDetailWidget extends StatelessWidget {
  const ConditionReportHistoryDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportHistoryController controller = Get.find();
    return ContainerContentReportHistoryDetailWidget(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detail Kondisi Sampah',
            style: TextStyleConstant.boldParagraph.copyWith(
              color: ColorConstant.netralColor900,
            ),
          ),
          Obx(() {
            return Text(
              controller.selectedHistory.value!.description,
              style: TextStyleConstant.boldParagraph.copyWith(
                color: ColorConstant.netralColor600,
              ),
            );
          }),
        ],
      ),
    );
  }
}
