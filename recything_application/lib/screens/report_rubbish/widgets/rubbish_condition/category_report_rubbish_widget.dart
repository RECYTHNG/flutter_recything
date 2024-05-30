import 'package:flutter/material.dart';

class RubbishCategoryReportRubbishWidget extends StatefulWidget {
  const RubbishCategoryReportRubbishWidget({super.key});

  @override
  _RubbishCategoryReportRubbishWidgetState createState() => _RubbishCategoryReportRubbishWidgetState();
}

class _RubbishCategoryReportRubbishWidgetState extends State<RubbishCategoryReportRubbishWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Jenis Sampah'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                const Text('Sampah Basah'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                const Text('Sampah Kering'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
