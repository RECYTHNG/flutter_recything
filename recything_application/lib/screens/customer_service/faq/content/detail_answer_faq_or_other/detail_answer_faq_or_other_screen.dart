import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/customer_service/faq/content/detail_answer_faq_or_other/widgets/container_feed_back_information_customer_service_widget.dart';
import 'package:recything_application/screens/customer_service/faq/widgets/container_remin_customer_service_widget.dart';

class DetailAnswerFAQorOtherScreen extends StatefulWidget {
  const DetailAnswerFAQorOtherScreen({super.key});

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
              'Apakah ada batasan jumlah poin yang dapat saya kumpulkan?',
              style: TextStyleConstant.regularTitle.copyWith(
                fontSize: 16.0,
                color: ColorConstant.netralColor900,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.justify,
            ),
            SpacingConstant.verticalSpacing400,
            Text(
              'Tidak, tidak ada batasan jumlah poin yang dapat Anda kumpulkan dalam aplikasi Recything. Anda dapat terus mengumpulkan poin sebanyak mungkin dengan melaporkan aktivitas membuang sampah sembarangan atau tumpukan sampah yang Anda temui. \n\nSemakin aktif Anda melaporkan, semakin banyak poin yang dapat Anda peroleh. Dengan mengumpulkan poin dalam jumlah besar, Anda memiliki kesempatan untuk menukarkannya dengan hadiah atau insentif lainnya yang lebih bernilai.',
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
