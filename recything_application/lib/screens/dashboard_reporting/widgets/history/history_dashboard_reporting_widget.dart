import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/report_history_controller.dart';
import 'package:recything_application/screens/dashboard_reporting/widgets/history/empty_state_history_dashboard_reporting_widget.dart';
import 'package:recything_application/screens/dashboard_reporting/widgets/history/header_history_dashboard_reporting_widget.dart';
import 'package:recything_application/screens/dashboard_reporting/widgets/history/list_history_dashboard_reporting_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class HistoryDashboardReportingWidget extends StatelessWidget {
  const HistoryDashboardReportingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportHistoryController controller = Get.find();
    return Obx(
      () {
        return Column(
          children: [
            const HeaderHistoryDashboardReportingWidget(),
            SpacingConstant.verticalSpacing100,
            if (controller.isLoadingFetchReportHistoryData.value)
              const SizedBox(
                width: double.infinity,
                height: 250,
                child: Center(
                  child: MyLoading(),
                ),
              )
            else if (controller.reportHistoryData.value!.data.isEmpty)
              const EmptyStateHistoryDashboardReportingWidget()
            else
              const ListHistoryDashboardReportingWidget(),
          ],
        );
      },
    );
  }
}
