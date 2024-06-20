import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/screens/report_rubbish/image/widgets/submit_button_upload_image_report_rubbish_widget.dart';
import 'package:recything_application/screens/report_rubbish/image/widgets/upload_image_report_rubbish_widget.dart';

class ImageReportRubbishWidget extends StatelessWidget {
  const ImageReportRubbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConstant.whiteColor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpacingConstant.verticalSpacing250,
                  const UploadImageReportRubbishWidget(),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SubmitButtonUploadImageReportRubbishWidget(),
          ),
          SpacingConstant.verticalSpacing250,
        ],
      ),
    );
  }
}