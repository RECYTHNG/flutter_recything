import 'package:flutter/material.dart';
import 'package:recything_application/screens/report_rubbish/widgets/rubbish_condition/category_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/widgets/rubbish_condition/condition_report_rubbish.dart';


class RubbishDescriptionReportRubbishWidget extends StatelessWidget {
  const RubbishDescriptionReportRubbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          RubbishConditionReportRubbish(),
          const SizedBox(height: 20),
          RubbishCategoryReportRubbishWidget(),
        ],
      ),
    );
  }
}
