import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/report_history_controller.dart';
import 'package:recything_application/screens/report_history_detail/widgets/container_content_report_history_detail_widget.dart';
import 'package:recything_application/screens/report_history_detail/widgets/item_container_report_history_detail_widget.dart';

class RubbishTypeReportHistoryDetailWidget extends StatelessWidget {
  const RubbishTypeReportHistoryDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportHistoryController controller = Get.find();
    return ContainerContentReportHistoryDetailWidget(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informasi Jenis Sampah',
            style: TextStyleConstant.boldParagraph.copyWith(
              color: ColorConstant.netralColor900,
            ),
          ),
          SpacingConstant.verticalSpacing075,
          if (controller.selectedHistory!.value.wasteType !=
              'sampah basah,sampah kering') ...[
            Obx(() {
              return ItemContainerReportHistoryDetailWidget(
                name: toBeginningOfSentenceCase(
                  controller.selectedHistory!.value.wasteType,
                ),
              );
            }),
          ] else ...[
            Row(
              children: [
                const ItemContainerReportHistoryDetailWidget(
                  name: 'Sampah Basah',
                ),
                SpacingConstant.horizontalSpacing150,
                const ItemContainerReportHistoryDetailWidget(
                  name: 'Sampah Kering',
                ),
              ],
            ),
          ]
        ],
      ),
    );
  }
}