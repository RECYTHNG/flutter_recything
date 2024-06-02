import 'package:flutter/material.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/screens/dashboard_reporting/widgets/history/header_history_dashboard_reporting_widget.dart';
import 'package:recything_application/screens/dashboard_reporting/widgets/history/list_history_dashboard_reporting_widget.dart';

class HistoryDashboardReportingWidget extends StatelessWidget {
  const HistoryDashboardReportingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderHistoryDashboardReportingWidget(),
        SpacingConstant.verticalSpacing100,
        const ListHistoryDashboardReportingWidget(),
      ],
    );
  }
}