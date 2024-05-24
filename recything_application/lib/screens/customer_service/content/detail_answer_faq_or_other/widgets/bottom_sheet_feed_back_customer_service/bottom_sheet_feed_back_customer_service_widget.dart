import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/customer_service/content/detail_answer_faq_or_other/widgets/bottom_sheet_feed_back_customer_service/option_item_feed_back_customer_service_widget.dart';

Future dialogBottomSheet(
    BuildContext context, VoidCallback handleDissatisfied) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.0),
        topRight: Radius.circular(32.0),
      ),
    ),
    backgroundColor: ColorConstant.whiteColor,
    builder: (BuildContext context) {
      return SizedBox(
        height: 265.0,
        width: double.infinity,
        child: Column(
          children: [
            SpacingConstant.verticalSpacing200,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 5.0,
                width: 64.0,
                decoration: BoxDecoration(
                  color: ColorConstant.netralColor600,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
            SpacingConstant.verticalSpacing200,
            SizedBox(
              height: 40.0,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                child: Text(
                  'Apa yang tidak anda suka?',
                  style: TextStyleConstant.regularTitle.copyWith(
                    fontSize: 16.0,
                    color: ColorConstant.netralColor900,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SpacingConstant.verticalSpacing200,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  FeedBackOptionCustomerServiceWidget(
                    caption: 'Saya tidak menemukan jawaban',
                    handleDissatisfied: handleDissatisfied,
                  ),
                  FeedBackOptionCustomerServiceWidget(
                    caption: 'Isi informasi tidak sesuai judul',
                    handleDissatisfied: handleDissatisfied,
                  ),
                  FeedBackOptionCustomerServiceWidget(
                    caption: 'Informasi ini membingungkan',
                    handleDissatisfied: handleDissatisfied,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
