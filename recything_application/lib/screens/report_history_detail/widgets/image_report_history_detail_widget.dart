import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/report_history_controller.dart';
import 'package:recything_application/screens/report_history_detail/widgets/container_content_report_history_detail_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ImageReportHistoryDetailWidget extends StatelessWidget {
  const ImageReportHistoryDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportHistoryController controller = Get.find();
    return ContainerContentReportHistoryDetailWidget(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bukti Foto',
            style: TextStyleConstant.boldParagraph.copyWith(
              color: ColorConstant.netralColor900,
            ),
          ),
          SpacingConstant.verticalSpacing075,
          if (controller.selectedHistory.value!.reportImages.isNotEmpty)
            Obx(() {
              return Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  ...controller.selectedHistory.value!.reportImages.map((item) {
                    return Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: ColorConstant.netralColor50,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress != null) {
                              return const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: MyLoading());
                            } else {
                              return child;
                            }
                          },
                        ),
                      ),
                    );
                  })
                ],
              );
            })
          else
            Text(
              'Tidak ada gambar',
              style: TextStyleConstant.boldParagraph.copyWith(
                color: ColorConstant.netralColor600,
              ),
            )
        ],
      ),
    );
  }
}
