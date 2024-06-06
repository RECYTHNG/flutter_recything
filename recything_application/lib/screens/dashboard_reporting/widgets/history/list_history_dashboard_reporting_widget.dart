import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/report_history_controller.dart';
import 'package:recything_application/screens/dashboard_reporting/widgets/history/item_history_dashboard_reporting_widget.dart';
import 'package:recything_application/screens/report_history_detail/report_history_detail_screen.dart';
import 'package:recything_application/screens/report_rubbish/details/details_report_rubbish_screen.dart';
import 'package:recything_application/utils/date_time_utils.dart';

class ListHistoryDashboardReportingWidget extends StatelessWidget {
  const ListHistoryDashboardReportingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportHistoryController controller = Get.find();
    return Container(
      padding: const EdgeInsets.only(bottom: 45),
      width: double.infinity,
      height: 320,
      child: Obx(
        () {
          return ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: controller.data.length,
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => SpacingConstant.verticalSpacing200,
            itemBuilder: (context, index) {
              final history = controller.data[index];
              return ItemHistoryDashboardReportingWidget(
                reportType: history.reportType,
                status: history.status,
                date: DateTimeUtils(dateTimeStringInput: history.createdAt).convertDate(),
                time: DateTimeUtils(dateTimeStringInput: history.createdAt).convertTime(),
                onTap: () {
                  controller.selectedHistory = history.obs;
                  Get.to(() => const ReportHistoryDetailScreen());
                },
              );
            },
          );
        },
      ),
    );
  }
}