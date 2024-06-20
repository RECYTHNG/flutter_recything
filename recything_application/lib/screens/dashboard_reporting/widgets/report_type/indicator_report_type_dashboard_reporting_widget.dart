import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/controllers/report_history_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndicatorReportTypeDashboardReportingWidget extends StatelessWidget {
  const IndicatorReportTypeDashboardReportingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportHistoryController controller = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () {
            return AnimatedSmoothIndicator(
              activeIndex: controller.currentIndexCarousell.value,
              count: 2,
              effect: const ExpandingDotsEffect(
                dotWidth: 40,
                dotHeight: 4,
                activeDotColor: ColorConstant.netralColor900,
              ),
            );
          },
        ),
      ],
    );
  }
}
