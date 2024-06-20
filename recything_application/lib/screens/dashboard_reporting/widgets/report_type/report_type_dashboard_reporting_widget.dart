import 'package:flutter/material.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/screens/dashboard_reporting/widgets/report_type/header_report_type_dashboard_reporting_widget.dart';
import 'package:recything_application/screens/dashboard_reporting/widgets/report_type/indicator_report_type_dashboard_reporting_widget.dart';
import 'package:recything_application/screens/dashboard_reporting/widgets/report_type/list_report_type_dashboard_reporting_widget.dart';

class ReportTypeDashboardReportingWidget extends StatelessWidget {
  const ReportTypeDashboardReportingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderReportTypeDashboardReportingWidget(),
        SpacingConstant.verticalSpacing150,
        ListReportTypeDashboardReportingWidget(),
        SpacingConstant.verticalSpacing200,
        const IndicatorReportTypeDashboardReportingWidget(),
      ],
    );
  }
}