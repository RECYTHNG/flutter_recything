import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/customer_service/detail_answer_faq_or_other/widgets/container_feed_back_information_customer_service_widget.dart';
import 'package:recything_application/screens/customer_service/cutomer_service_faq_main/widgets/container_remin_customer_service_widget.dart';

class DetailAnswerFAQorOtherScreen extends StatefulWidget {
  final String question;
  final String answer;
  const DetailAnswerFAQorOtherScreen({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  State<DetailAnswerFAQorOtherScreen> createState() =>
      _DetailAnswerFAQorOtherScreenState();
}

class _DetailAnswerFAQorOtherScreenState
    extends State<DetailAnswerFAQorOtherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpacingConstant.verticalSpacing200,
            Text(
              widget.question,
              style: TextStyleConstant.regularTitle.copyWith(
                fontSize: 16.0,
                color: ColorConstant.netralColor900,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.justify,
            ),
            SpacingConstant.verticalSpacing400,
            Text(
              widget.answer,
              style: TextStyleConstant.regularParagraph.copyWith(
                fontSize: 12.0,
                color: ColorConstant.netralColor900,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.justify,
            ),
            SpacingConstant.verticalSpacing400,
            const ReMinCustomerServiceWidget(),
            SpacingConstant.verticalSpacing300,
            const FeedBackInformationCustomerServiceWidget(),
          ],
        ),
      ),
    );
  }
}
