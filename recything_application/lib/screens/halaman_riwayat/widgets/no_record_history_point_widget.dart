import 'package:flutter/material.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class NoRecordHistoryPointWidget extends StatelessWidget {
  const NoRecordHistoryPointWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageConstant.noRecordImage,
          ),
          Text(
            'Belum ada riwayat poin.',
            style: TextStyleConstant.regularParagraph,
          ),
          Text(
            'Yuk ikuti challenge dan raih poin pertamamu!',
            style: TextStyleConstant.regularParagraph,
          ),
        ],
      ),
    );
  }
}
