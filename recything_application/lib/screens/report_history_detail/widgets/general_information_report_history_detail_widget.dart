import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/string_value_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/report_history_controller.dart';
import 'package:recything_application/screens/report_history_detail/widgets/container_content_report_history_detail_widget.dart';

class GeneralInformationReportHistoryDetailWidget extends StatelessWidget {
  const GeneralInformationReportHistoryDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportHistoryController controller = Get.find();
    return ContainerContentReportHistoryDetailWidget(
      widget: Column(
        children: [
          Row(
            children: [
              Text(
                'Jenis Pelaporan',
                style: TextStyleConstant.boldParagraph.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              ),
              const SizedBox(width: 26),
              Text(
                ':',
                style: TextStyleConstant.boldParagraph.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return Text(
                        controller.selectedHistory.value!.reportType ==
                                'rubbish'
                            ? 'Tumpukan Sampah'
                            : 'Sampah Sembarangan',
                        style: TextStyleConstant.boldParagraph.copyWith(
                          color: ColorConstant.netralColor600,
                        ),
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Status Pelaporan',
                style: TextStyleConstant.boldParagraph.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                ':',
                style: TextStyleConstant.boldParagraph.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              ),
              const SizedBox(width: 10),
              Obx(() {
                return Text(
                  controller.selectedHistory.value!.status == 'need review'
                      ? 'PROSES'
                      : controller.selectedHistory.value!.status == 'approve'
                          ? 'DITERIMA'
                          : 'DITOLAK',
                  style: TextStyleConstant.boldParagraph.copyWith(
                    color: controller.selectedHistory.value!.status ==
                            'need review'
                        ? ColorConstant.warningColor500
                        : controller.selectedHistory.value!.status == 'approve'
                            ? ColorConstant.successColor500
                            : ColorConstant.dangerColor500,
                  ),
                );
              })
            ],
          ),
          if (controller.selectedHistory.value!.status == 'reject') ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alasan',
                  style: TextStyleConstant.boldParagraph.copyWith(
                    color: ColorConstant.netralColor900,
                  ),
                ),
                const SizedBox(width: 84),
                Text(
                  ':',
                  style: TextStyleConstant.boldParagraph.copyWith(
                    color: ColorConstant.netralColor900,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        return Text(
                          controller.selectedHistory.value!.reason,
                          style: TextStyleConstant.boldParagraph.copyWith(
                            color: ColorConstant.netralColor600,
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
          ],
          if (controller.selectedHistory.value!.status == 'approve' ||
              controller.selectedHistory.value!.status == 'need review') ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacingConstant.verticalSpacing050,
                Obx(() {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      controller.selectedHistory.value!.status == 'approve'
                          ? StringValueConstant.approveTextMessage
                          : StringValueConstant.needReviewTextMessage,
                      style: TextStyleConstant.boldParagraph.copyWith(
                        color: ColorConstant.netralColor600,
                      ),
                    ),
                  );
                })
              ],
            ),
          ]
        ],
      ),
    );
  }
}
