import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/report_history_controller.dart';
import 'package:recything_application/screens/report_history_detail/widgets/container_content_report_history_detail_widget.dart';

class LocationReportHistoryDetailWidget extends StatelessWidget {
  const LocationReportHistoryDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportHistoryController controller = Get.find();
    return ContainerContentReportHistoryDetailWidget(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lokasi Tumpukan Sampah',
            style: TextStyleConstant.boldParagraph.copyWith(
              color: ColorConstant.netralColor900,
            ),
          ),
          Obx(() {
            return Text(
              '${controller.selectedHistory!.value.address}, ${controller.selectedHistory!.value.city}, ${controller.selectedHistory!.value.province}',
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
